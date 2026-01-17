use crate::Type;
use crate::Var;
use crate::asm::CmpKind;
use crate::asm::IorF;
use crate::asm::LOCAL_FREG;
use crate::asm::Regs;
use crate::asm::{ARG_FREG, ARG_REG, FReg, LOCAL_REG, Reg};
use crate::asm::{Asm, AsmFn, AsmProg, BinOpKind, UniOpKind, ValueBox};
use crate::closure::ClsDef;
use crate::emit_asm::AsmEmitter;
use crate::vmachine::VMachine;
use crate::vmachine::{IdImm, VMProg};
use crate::vmachine::{VMExp, VMFn};

use std::collections::{BTreeSet, HashMap};
use std::mem::swap;

pub struct RegisterAllocator<'a> {
    free_reg: BTreeSet<Reg>,
    free_freg: BTreeSet<FReg>,
    reg2var: HashMap<Reg, String>,         // reg -> var
    freg2var: HashMap<FReg, String>,       // freg -> var
    var2reg: HashMap<String, ValueBox>,    // var -> reg/mem
    spilled: HashMap<String, (i32, bool)>, // var -> offset
    icounts: HashMap<&'a str, usize>,
    fcounts: HashMap<&'a str, usize>,
    if_counts: HashMap<
        &'a str,
        (
            (HashMap<&'a str, usize>, HashMap<&'a str, usize>), // then
            (HashMap<&'a str, usize>, HashMap<&'a str, usize>), // else
        ),
    >, // if内でどれだけ使うか
    spill_count: usize,
    is_closure: bool,
    selfcls_spilled: bool,
    fntype: HashMap<String, Type>,
}

impl<'a> RegisterAllocator<'a> {
    pub fn new() -> Self {
        Self {
            free_reg: LOCAL_REG.into_iter().collect(),
            free_freg: LOCAL_FREG.into_iter().collect(),
            reg2var: HashMap::new(),
            freg2var: HashMap::new(),
            var2reg: HashMap::new(),
            spilled: HashMap::new(),
            spill_count: 2,
            icounts: HashMap::new(),
            fcounts: HashMap::new(),
            if_counts: HashMap::new(),
            is_closure: false,
            selfcls_spilled: false,
            fntype: HashMap::new(),
        }
    }

    fn reset_regmap(&mut self) {
        self.var2reg.clear();
        self.reg2var.clear();
        self.freg2var.clear();
        self.free_reg = LOCAL_REG.into_iter().collect();
        self.free_freg = LOCAL_FREG.into_iter().collect();
        self.spill_count = 2;
        self.spilled.clear();
        self.selfcls_spilled = false;
    }

    fn use_incl<'b>(counts: &mut HashMap<&'b str, usize>, var: &'b str) {
        // eprintln!("incl: {var}");
        if let Some(v) = counts.get_mut(var) {
            *v += 1;
        } else {
            counts.insert(var, 1);
        }
    }

    fn use_idecl<'b>(&mut self, var: &'b str) {
        // eprintln!("idecl: {var}");
        if let Some(v) = self.icounts.get_mut(var) {
            *v -= 1;
            if *v == 0 {
                match self.var2reg.get(var) {
                    Some(ValueBox::Reg(reg)) if *reg != AsmEmitter::clsr => {
                        self.free_reg.insert(*reg); // free register
                        self.reg2var.remove(reg);
                    }
                    Some(ValueBox::FReg(_)) => {
                        // self.free_freg.insert(*reg);
                    }
                    _ => (),
                }
                self.var2reg.remove(var);
                self.icounts.remove(var);
            }
        } else {
            panic!("Not found: {var}");
        }
    }

    fn use_fdecl<'b>(&mut self, var: &'b str) {
        // eprintln!("fdecl: {var}");
        if let Some(v) = self.fcounts.get_mut(var) {
            *v -= 1;
            if *v == 0 {
                match self.var2reg.get(var) {
                    Some(ValueBox::Reg(_)) => {
                        // self.free_reg.insert(*reg); // free register
                    }
                    Some(ValueBox::FReg(reg)) => {
                        self.free_freg.insert(*reg);
                        self.freg2var.remove(reg);
                    }
                    _ => (),
                }
                self.var2reg.remove(var);
                self.fcounts.remove(var);
            }
        } else {
            panic!("Not found: {var}");
        }
    }

    fn asm_vars(&mut self, fndef: &VMFn) -> Vec<(Var, ValueBox)> {
        // add ValueBox to args
        // and construct new lvar
        let mut exargs = Vec::new();
        let mut regit = ARG_REG.iter();
        let mut fregit = ARG_FREG.iter();
        let mut stack_save_count = 0;
        let mycls = &fndef.name;
        let clsr = AsmEmitter::clsr;

        for (v, t) in &fndef.args {
            match t {
                Type::Float => {
                    if let Some(r) = fregit.next() {
                        self.free_freg.remove(r);
                        self.freg2var.insert(*r, v.clone());
                        self.var2reg.insert(v.clone(), ValueBox::FReg(*r));
                        exargs.push(((v.clone(), t.clone()), ValueBox::FReg(*r)));
                    } else {
                        stack_save_count += 1;
                    }
                }
                _ => {
                    if let Some(r) = regit.next() {
                        self.free_reg.remove(r);
                        self.reg2var.insert(*r, v.clone());
                        self.var2reg.insert(v.clone(), ValueBox::Reg(*r));
                        exargs.push(((v.clone(), t.clone()), ValueBox::Reg(*r)));
                    } else {
                        stack_save_count += 1;
                    }
                }
            }
        }
        if self.is_closure {
            self.var2reg.insert(mycls.0.clone(), ValueBox::Reg(clsr));
        }

        if stack_save_count > 0 {
            panic!("too many arguments");
        }
        if fndef.freevar.len() > 0 {
            // if f is called by closure
            for (i, (fv, ty)) in fndef.freevar.iter().enumerate() {
                let iorf = if let Type::Float = ty {
                    IorF::F
                } else {
                    IorF::I
                };
                self.var2reg
                    .insert(fv.clone(), ValueBox::Cls((i as i32 + 1) * 4, iorf));
            }
        }

        exargs
    }

    fn var_counts(&mut self, fndef: &'a VMFn) {
        let mut icounts = HashMap::new();
        let mut fcounts = HashMap::new();
        let mut count_stack: Vec<(HashMap<&str, usize>, HashMap<&str, usize>)> = Vec::new();
        for code in &fndef.body {
            match code {
                VMachine::Let(_, exp, _) => match exp {
                    VMExp::Neg(v) => {
                        Self::use_incl(&mut icounts, v);
                    }
                    VMExp::FNeg(v) => {
                        Self::use_incl(&mut fcounts, v);
                    }
                    VMExp::Var(v) => {
                        if let Some((Type::Float, _)) = fndef.lvar.get(v) {
                            Self::use_incl(&mut fcounts, v);
                        } else {
                            Self::use_incl(&mut icounts, v);
                        }
                    }
                    VMExp::Add(a, b) | VMExp::Sub(a, b) | VMExp::Get(a, b) => {
                        Self::use_incl(&mut icounts, a);
                        if let IdImm::Id(b) = &b {
                            Self::use_incl(&mut icounts, b);
                        }
                    }
                    VMExp::Shl(a, _) | VMExp::Shr(a, _) => {
                        Self::use_incl(&mut icounts, a);
                    }
                    VMExp::FAdd(a, b)
                    | VMExp::FSub(a, b)
                    | VMExp::FMul(a, b)
                    | VMExp::FDiv(a, b)
                    | VMExp::FEql(a, b)
                    | VMExp::FLeq(a, b) => {
                        Self::use_incl(&mut fcounts, a);
                        Self::use_incl(&mut fcounts, b);
                    }
                    VMExp::AppDir(_, vl)
                    | VMExp::Tuple(vl)
                    | VMExp::MakeCls(ClsDef {
                        label: _,
                        freevar: vl,
                    }) => {
                        vl.iter().for_each(|v| {
                            if let Some((Type::Float, _)) = fndef.lvar.get(v) {
                                Self::use_incl(&mut fcounts, v);
                            } else {
                                Self::use_incl(&mut icounts, v);
                            }
                        });
                    }
                    VMExp::AppCls(cls, vl) => {
                        Self::use_incl(&mut icounts, cls);
                        vl.iter().for_each(|v| {
                            if let Some((Type::Float, _)) = fndef.lvar.get(v) {
                                Self::use_incl(&mut fcounts, v);
                            } else {
                                Self::use_incl(&mut icounts, v);
                            }
                        });
                    }
                    _ => (),
                },
                VMachine::RetVal(var) => {
                    if self.is_float(var, &fndef.lvar) {
                        Self::use_incl(&mut fcounts, var);
                    } else {
                        Self::use_incl(&mut icounts, var);
                    }
                }
                VMachine::Beq(a, b, _) | VMachine::Bge(a, b, _) => {
                    Self::use_incl(&mut icounts, a);
                    Self::use_incl(&mut icounts, b);

                    // ifに入る前のcountsをstackに保存
                    let mut iprev = HashMap::new();
                    let mut fprev = HashMap::new();
                    swap(&mut icounts, &mut iprev);
                    swap(&mut fcounts, &mut fprev);
                    count_stack.push((iprev, fprev));
                }
                VMachine::Beqz(a, _) | VMachine::Bnez(a, _) => {
                    Self::use_incl(&mut icounts, a);

                    // ifに入る前のcountsをstackに保存
                    let mut iprev = HashMap::new();
                    let mut fprev = HashMap::new();
                    swap(&mut icounts, &mut iprev);
                    swap(&mut fcounts, &mut fprev);
                    count_stack.push((iprev, fprev));
                }
                VMachine::Label(label) => {
                    if label.ends_with("then") {
                        // ifの前のcountsを復元
                        let mut iprev = HashMap::new();
                        let mut fprev = HashMap::new();
                        swap(&mut icounts, &mut iprev);
                        swap(&mut fcounts, &mut fprev);

                        // else節のcountsを保存しておく
                        count_stack.push((iprev, fprev));
                    } else if label.ends_with("final") {
                        // merge then & else
                        let br = label.strip_suffix("final").unwrap();
                        let (ielse, felse) = count_stack.pop().unwrap();

                        let (ithen, fthen) = {
                            // これはまだifの前のcountsが入っている
                            let (mut ithen, mut fthen) = count_stack.pop().unwrap();
                            // のでswap
                            swap(&mut icounts, &mut ithen);
                            swap(&mut fcounts, &mut fthen);
                            (ithen, fthen)
                        };

                        let mut iunion = ithen.clone();

                        for (br, celse) in &ielse {
                            let cthen = iunion.get(br).unwrap_or(&0);
                            iunion.insert(br, *cthen.max(celse));
                        }
                        for (br, cunion) in iunion {
                            if let Some(c) = icounts.get_mut(br) {
                                *c += cunion;
                            } else {
                                icounts.insert(br, cunion);
                            }
                        }

                        let mut funion = fthen.clone();

                        for (br, celse) in &felse {
                            let cthen = funion.get(br).unwrap_or(&0);
                            funion.insert(br, *cthen.max(celse));
                        }
                        for (br, cunion) in funion {
                            if let Some(c) = fcounts.get_mut(br) {
                                *c += cunion;
                            } else {
                                fcounts.insert(br, cunion);
                            }
                        }

                        self.if_counts.insert(br, ((ithen, fthen), (ielse, felse)));
                    }
                }
                VMachine::Put(arr, idx, var) => {
                    Self::use_incl(&mut icounts, arr);
                    if let IdImm::Id(idx) = idx {
                        Self::use_incl(&mut icounts, idx);
                    }
                    if let Some((Type::Float, _)) = fndef.lvar.get(var) {
                        Self::use_incl(&mut fcounts, var);
                    } else {
                        Self::use_incl(&mut icounts, var);
                    }
                }
                _ => (),
            }
        }
        (self.icounts, self.fcounts) = (icounts, fcounts);
    }

    fn create_branch_counts(
        base: &HashMap<&'a str, usize>,
        (then_inner, else_inner): (&HashMap<&'a str, usize>, &HashMap<&'a str, usize>),
    ) -> (
        HashMap<&'a str, usize>,
        HashMap<&'a str, usize>,
        HashMap<&'a str, usize>,
    ) {
        let (mut then_counts, mut else_counts, mut final_counts) =
            (then_inner.clone(), else_inner.clone(), HashMap::new());

        for (var, count) in base {
            let cthen = *then_inner.get(var).unwrap_or(&0);
            let celse = *else_inner.get(var).unwrap_or(&0);
            let bigger = cthen.max(celse);

            let c = count - bigger + cthen;
            if c > 0 {
                then_counts.insert(*var, c);
            }
            let c = count - bigger + celse;
            if c > 0 {
                else_counts.insert(*var, c);
            }
            if *count > bigger {
                final_counts.insert(*var, count - bigger);
            }
        }

        (then_counts, else_counts, final_counts)
    }

    fn spill_incl(&mut self) -> i32 {
        let res = self.spill_count;
        self.spill_count += 1;
        res as i32
    }

    fn ivar_spill(&mut self, asm: &mut Vec<Asm>, var: &str) {
        match self.var2reg.get(var) {
            Some(ValueBox::Reg(r)) => {
                let r = *r;
                let reg = ValueBox::Reg(r);
                match self.spilled.get(var) {
                    Some((oft, false)) => {
                        self.spilled.insert(var.to_string(), (*oft, true));
                    }
                    None => {
                        let oft = self.spill_incl() * 4;
                        self.spilled.insert(var.to_string(), (oft, true));
                    }
                    _ => (),
                }
                let (oft, _) = *self.spilled.get(var).unwrap();
                self.var2reg
                    .insert(var.to_string(), ValueBox::Mem(oft, IorF::I));

                asm.push(Asm::Mv(ValueBox::Mem(oft, IorF::I), reg));
            }
            Some(ValueBox::FReg(_)) => unreachable!(),
            _ => (),
        }
    }

    fn fvar_spill(&mut self, asm: &mut Vec<Asm>, var: &str) {
        match self.var2reg.get(var) {
            Some(ValueBox::Reg(_)) => unreachable!(),
            Some(ValueBox::FReg(r)) => {
                let r = *r;
                let reg = ValueBox::FReg(r);
                match self.spilled.get(var) {
                    Some((oft, false)) => {
                        self.spilled.insert(var.to_string(), (*oft, true));
                    }
                    None => {
                        let oft = self.spill_incl() * 4;
                        self.spilled.insert(var.to_string(), (oft, true));
                    }
                    _ => (),
                }
                let (oft, _) = *self.spilled.get(var).unwrap();

                self.var2reg
                    .insert(var.to_string(), ValueBox::Mem(oft, IorF::F));
                asm.push(Asm::Mv(ValueBox::Mem(oft, IorF::F), reg));
            }
            _ => (),
        }
    }

    // 一番使われなさそうな変数を探してspill
    fn ialloc_spill(&mut self, asm: &mut Vec<Asm>) -> Reg {
        eprintln!("reg spilled!");
        let (reg, var) = self
            .reg2var
            .iter()
            .min_by_key(|(_, var)| self.icounts.get(var as &str).unwrap_or(&usize::MAX))
            .unwrap();
        let res = *reg;
        let var = var.to_string();

        let oft = match self.spilled.get(&var) {
            Some((oft, _)) => {
                let oft = *oft;
                self.spilled.insert(var.clone(), (oft, true));
                asm.push(Asm::Mv(ValueBox::Mem(oft, IorF::I), ValueBox::Reg(res)));
                oft
            }
            None => {
                let var = var.to_string();
                let oft = self.spill_incl() * 4;
                asm.push(Asm::Mv(ValueBox::Mem(oft, IorF::I), ValueBox::Reg(res)));
                self.spilled.insert(var, (oft, true));
                oft
            }
        };
        self.var2reg.insert(var, ValueBox::Mem(oft, IorF::I));
        self.reg2var.remove(&res);

        res
    }

    fn falloc_spill(&mut self, asm: &mut Vec<Asm>) -> FReg {
        eprintln!("freg spilled!");
        let (reg, var) = self
            .freg2var
            .iter()
            .min_by_key(|(_, var)| self.fcounts.get(var as &str).unwrap_or(&usize::MAX))
            .unwrap();
        let res = *reg;
        let var = var.to_string();
        let oft = match self.spilled.get(&var) {
            Some((oft, _)) => {
                let oft = *oft;
                self.spilled.insert(var.clone(), (oft, true));
                asm.push(Asm::Mv(ValueBox::Mem(oft, IorF::F), ValueBox::FReg(res)));
                oft
            }
            None => {
                let var = var.to_string();
                let oft = self.spill_incl() * 4;
                asm.push(Asm::Mv(ValueBox::Mem(oft, IorF::F), ValueBox::FReg(res)));
                self.spilled.insert(var, (oft, true));
                oft
            }
        };

        self.var2reg.insert(var, ValueBox::Mem(oft, IorF::F));
        self.freg2var.remove(&res);
        res
    }

    fn give_ireg(&mut self, asm: &mut Vec<Asm>, vbox: ValueBox, var: Option<&str>) -> Reg {
        match vbox {
            ValueBox::Reg(r) => r,
            ValueBox::FReg(_) => unreachable!(),
            ValueBox::Mem(_, _) => {
                let newreg = self.ialloc(asm, var);
                asm.push(Asm::Mv(ValueBox::Reg(newreg), vbox));
                newreg
            }
            ValueBox::Cls(_, _) => {
                let newreg = self.ialloc(asm, var);
                asm.push(Asm::Mv(ValueBox::Reg(newreg), vbox));
                newreg
            }
        }
    }

    fn give_freg(&mut self, asm: &mut Vec<Asm>, vbox: ValueBox, var: Option<&str>) -> FReg {
        match vbox {
            ValueBox::Reg(_) => unreachable!(),
            ValueBox::FReg(r) => r,
            ValueBox::Mem(_, _) => {
                let newreg = self.falloc(asm, var);
                asm.push(Asm::Mv(ValueBox::FReg(newreg), vbox));
                newreg
            }
            ValueBox::Cls(_, _) => {
                let newreg = self.falloc(asm, var);
                asm.push(Asm::Mv(ValueBox::FReg(newreg), vbox));
                newreg
            }
        }
    }

    fn set_parallel(&mut self, asm: &mut Vec<Asm>, map: Vec<(ValueBox, ValueBox)>) {
        use ValueBox::Cls;

        // 専用のstructを作ってみる
        struct Visitor<'a> {
            map: Vec<(ValueBox, ValueBox)>,
            visit_list: HashMap<ValueBox, State>,
            spilled: Option<(ValueBox, ValueBox)>,
            asm: &'a mut Vec<Asm>,
        }

        #[derive(Debug, Clone, Copy)]
        enum State {
            Unvisited,
            Visiting,
            Visited,
        }

        use State::{Unvisited, Visited, Visiting};

        impl<'a> Visitor<'a> {
            fn run(mut map: Vec<(ValueBox, ValueBox)>, asm: &'a mut Vec<Asm>) {
                let mut visit_list = HashMap::new();
                for (src, dst) in map.clone() {
                    if let Cls(..) = src {
                        map.push((ValueBox::Reg(AsmEmitter::clsr), src));
                        visit_list.insert(ValueBox::Reg(AsmEmitter::clsr), Unvisited);
                    }
                    visit_list.insert(src, Unvisited);
                    visit_list.insert(dst, Unvisited);
                }

                let mut res = Self {
                    map,
                    visit_list,
                    spilled: None,
                    asm,
                };

                'outer: loop {
                    for (&node, &state) in res.visit_list.iter() {
                        if let Unvisited = state {
                            res.spilled = None;
                            res.visit(node);
                            continue 'outer;
                        }
                    }
                    break;
                }
            }

            fn visit(&mut self, curr: ValueBox) {
                let itmp = AsmEmitter::itmp;
                let ftmp = AsmEmitter::ftmp;
                let clsr = AsmEmitter::clsr;

                if let Some(Visited) = self.visit_list.get(&curr) {
                    return;
                }
                self.visit_list.insert(curr, Visiting);

                let len = self.map.len();
                for i in 0..len {
                    let (src, dst) = self.map[i];
                    if src == curr {
                        if src == dst {
                            continue;
                        }

                        match self.visit_list.get(&dst).unwrap() {
                            Unvisited => {
                                // 探索を続行
                                self.visit(dst);
                            }
                            Visiting => {
                                // ループになっとるねぇ
                                // 閉路は連結成分につき一つのはず
                                assert!(self.spilled.is_none());

                                // dstを退避！
                                match dst {
                                    ValueBox::Reg(_)
                                    | ValueBox::Mem(_, IorF::I)
                                    | Cls(_, IorF::I) => {
                                        self.asm.push(Asm::Mv(ValueBox::Reg(itmp), dst));
                                        self.spilled = Some((dst, ValueBox::Reg(itmp)));
                                    }
                                    ValueBox::FReg(_)
                                    | ValueBox::Mem(_, IorF::F)
                                    | Cls(_, IorF::F) => {
                                        self.asm.push(Asm::Mv(ValueBox::FReg(ftmp), dst));
                                        self.spilled = Some((dst, ValueBox::FReg(ftmp)));
                                    }
                                }
                            }
                            Visited => (),
                        }

                        // いざdstの書き換え！
                        if let Cls(..) = dst {
                            continue;
                        }
                        if let Some((spilled, tmp)) = self.spilled {
                            if spilled == src {
                                self.asm.push(Asm::Mv(dst, tmp));
                            } else if let (Cls(oft, _), ValueBox::Reg(rs)) = (src, spilled) {
                                if rs == clsr {
                                    let rt = RegisterAllocator::valuebox_to_regs(tmp);
                                    let rd = RegisterAllocator::valuebox_to_regs(dst);
                                    self.asm
                                        .push(Asm::BinOpImm(BinOpKind::Get, rd, rt, oft / 4));
                                } else {
                                    self.asm.push(Asm::Mv(dst, src));
                                }
                            } else {
                                self.asm.push(Asm::Mv(dst, src));
                            }
                        } else {
                            self.asm.push(Asm::Mv(dst, src));
                        }
                    }
                }

                self.visit_list.insert(curr, Visited);
            }
        }

        let mut asm_buf = Vec::new();
        swap(asm, &mut asm_buf);

        Visitor::run(map, asm);

        swap(asm, &mut asm_buf);
        asm.append(&mut asm_buf);
    }

    fn valuebox_to_regs(vbox: ValueBox) -> Regs {
        match vbox {
            ValueBox::Reg(reg) => Regs::Reg(reg),
            ValueBox::FReg(reg) => Regs::FReg(reg),
            _ => panic!("not a register: {:?}", vbox),
        }
    }

    /// 引数：
    /// - asm: 出力先
    /// - regmap: src -> dist
    /// - cls: 最終的にclsrにセットしたい値の場所
    fn set_arguments(
        &mut self,
        asm: &mut Vec<Asm>,
        regmap: Vec<(Option<ValueBox>, Type)>,
        cls: Option<ValueBox>,
    ) {
        let mut regit = ARG_REG.iter();
        let mut fregit = ARG_FREG.iter();

        let mut map: Vec<(ValueBox, ValueBox)> = regmap
            .iter()
            .filter_map(|arg| match arg {
                (Some(vbox), Type::Float) => {
                    let r = fregit.next().unwrap();
                    Some((*vbox, ValueBox::FReg(*r)))
                }
                (Some(vbox), _) => {
                    let r = regit.next().unwrap();
                    Some((*vbox, ValueBox::Reg(*r)))
                }
                (None, Type::Float) => {
                    fregit.next();
                    None
                }
                _ => {
                    regit.next();
                    None
                }
            })
            .collect();
        if let Some(cls) = cls {
            map.push((cls, ValueBox::Reg(AsmEmitter::clsr)));
        }

        self.set_parallel(asm, map);
    }

    fn ialloc(&mut self, asm: &mut Vec<Asm>, var: Option<&str>) -> Reg {
        let res = if let Some(reg) = self.free_reg.pop_first() {
            reg
        } else {
            self.ialloc_spill(asm)
        };
        if let Some(name) = var {
            self.var2reg.insert(name.to_string(), ValueBox::Reg(res));
            self.reg2var.insert(res, name.to_string());
        }

        res
    }

    fn falloc(&mut self, asm: &mut Vec<Asm>, var: Option<&str>) -> FReg {
        let res = if let Some(reg) = self.free_freg.pop_first() {
            reg
        } else {
            self.falloc_spill(asm)
        };
        if let Some(name) = var {
            self.var2reg.insert(name.to_string(), ValueBox::FReg(res));
            self.freg2var.insert(res, name.to_string());
        }

        res
    }

    fn contruct_regmap(
        varmap: &HashMap<String, ValueBox>,
    ) -> (HashMap<Reg, String>, HashMap<FReg, String>) {
        let mut imap = HashMap::new();
        let mut fmap = HashMap::new();

        for (var, vbox) in varmap {
            match vbox {
                ValueBox::Reg(r) if *r != AsmEmitter::clsr => {
                    imap.insert(*r, var.to_string());
                }
                ValueBox::FReg(r) => {
                    fmap.insert(*r, var.to_string());
                }
                _ => (),
            }
        }

        (imap, fmap)
    }

    fn is_float(&self, var: &str, lvar: &HashMap<String, (Type, Option<i32>)>) -> bool {
        match lvar.get(var) {
            Some((Type::Float, _)) => true,
            Some(_) => false,
            None => panic!("Not Found {var}"),
        }
    }

    // fn iload(&mut self, asm: &mut Vec<Asm>, vbox: ValueBox) -> Reg {
    //     match vbox {
    //         ValueBox::Reg(reg) => reg,
    //         ValueBox::Mem(_) | ValueBox::Cls(_) => {
    //             let reg = self.ialloc(asm);
    //             asm.push(Asm::Mv(ValueBox::Reg(reg), vbox));
    //             reg
    //         }
    //         ValueBox::FReg(_) => unreachable!(),
    //     }
    // }

    fn regalloc_fn(&mut self, fndef: &'a VMFn) -> AsmFn {
        self.var_counts(fndef);
        // eprintln!("icounts: {:?}", self.icounts);
        // eprintln!("fcounts: {:?}", self.fcounts);
        // eprintln!("if counts: {:?}", self.if_counts);
        let mut asms = Vec::new();
        let exargs = self.asm_vars(fndef);

        let mut count_stack = Vec::new();
        let mut regmap_stack = Vec::new();
        let mut varmap_stack = Vec::new();
        let mut free_stack = Vec::new();
        let mut spill_stack = Vec::new();
        let mut spcnt_stack = Vec::new();

        for code in &fndef.body {
            // eprintln!(
            //     "{:?}, {:?}, {:?}",
            //     self.reg2var, self.freg2var, self.var2reg,
            // );
            match code {
                VMachine::Let(var, exp, _) => {
                    // eprintln!("hey, {}", var);
                    let used = if let Some(0) = self.icounts.get(var as &str) {
                        false
                    } else if let Some(0) = self.fcounts.get(var as &str) {
                        false
                    } else if let Some((Type::Unit, _)) = fndef.lvar.get(var) {
                        false
                    } else {
                        self.icounts.contains_key(var as &str)
                            || self.fcounts.contains_key(var as &str)
                    };
                    match exp {
                        VMExp::Neg(v) if used => {
                            let vbox = *self.var2reg.get(v).unwrap_or_else(|| {
                                panic!("Not Found in var2reg: {v}");
                            });
                            let r1 = self.give_ireg(&mut asms, vbox, Some(v));
                            self.use_idecl(v);
                            let newreg = self.ialloc(&mut asms, Some(var));
                            asms.push(Asm::UniOp(UniOpKind::Neg, Regs::Reg(newreg), Regs::Reg(r1)));
                        }
                        VMExp::Neg(v) => {
                            self.use_idecl(v);
                        }
                        VMExp::FNeg(v) if used => {
                            let vbox = *self.var2reg.get(v).unwrap_or_else(|| {
                                panic!("Not Found in var2reg: {v}");
                            });
                            let r1 = self.give_freg(&mut asms, vbox, Some(v));
                            self.use_fdecl(v);
                            let newreg = self.falloc(&mut asms, Some(var));
                            asms.push(Asm::UniOp(
                                UniOpKind::FNeg,
                                Regs::FReg(newreg),
                                Regs::FReg(r1),
                            ))
                        }
                        VMExp::FNeg(v) if used => {
                            self.use_fdecl(v);
                        }
                        VMExp::Var(v) if used => {
                            if let Some((Type::Float, _)) = fndef.lvar.get(v) {
                                let vbox = *self.var2reg.get(v).unwrap_or_else(|| {
                                    panic!("Not Found in var2reg: {v}");
                                });
                                self.use_fdecl(v);
                                let newreg = self.falloc(&mut asms, Some(var));
                                asms.push(Asm::Mv(ValueBox::FReg(newreg), vbox));
                            } else {
                                let vbox = *self.var2reg.get(v).unwrap_or_else(|| {
                                    panic!("Not Found in var2reg: {v}");
                                });
                                self.use_idecl(v);
                                let newreg = self.ialloc(&mut asms, Some(var));
                                asms.push(Asm::Mv(ValueBox::Reg(newreg), vbox));
                            }
                        }
                        VMExp::Var(v) => {
                            if let Some((Type::Float, _)) = fndef.lvar.get(v) {
                                self.use_fdecl(v);
                            } else {
                                self.use_idecl(v);
                            }
                        }
                        VMExp::Add(a, b) | VMExp::Sub(a, b) | VMExp::Get(a, b) if used => {
                            /*  レジスタ確保
                                1. a, bがもしspillされているなら割り当て
                                2. a, bを解放
                                3. varを割り当て
                                この順番が大事
                            */
                            // eprintln!("nani!? {}", var);
                            let vbox1 = *self
                                .var2reg
                                .get(a)
                                .unwrap_or_else(|| panic!("Not Found in var2reg: {a}"));
                            let reg1 = self.give_ireg(&mut asms, vbox1, Some(a));
                            let op = match exp {
                                VMExp::Add(_, _) => BinOpKind::Add,
                                VMExp::Sub(_, _) => BinOpKind::Sub,
                                VMExp::Get(_, _) => BinOpKind::Get,
                                _ => unreachable!(),
                            };
                            match &b {
                                IdImm::Id(b) => {
                                    let vbox2 = *self
                                        .var2reg
                                        .get(b)
                                        .unwrap_or_else(|| panic!("Not Found in var2reg: {b}"));
                                    let reg2 = self.give_ireg(&mut asms, vbox2, Some(b));
                                    self.use_idecl(a);
                                    self.use_idecl(b);
                                    let newreg = if self.is_float(var, &fndef.lvar) {
                                        let reg = self.falloc(&mut asms, Some(var));
                                        Regs::FReg(reg)
                                    } else {
                                        let reg = self.ialloc(&mut asms, Some(var));
                                        Regs::Reg(reg)
                                    };

                                    asms.push(Asm::BinOp(
                                        op,
                                        newreg,
                                        Regs::Reg(reg1),
                                        Regs::Reg(reg2),
                                    ));
                                }
                                IdImm::Int(b) => {
                                    self.use_idecl(a);
                                    let newreg = if self.is_float(var, &fndef.lvar) {
                                        let reg = self.falloc(&mut asms, Some(var));
                                        Regs::FReg(reg)
                                    } else {
                                        let reg = self.ialloc(&mut asms, Some(var));
                                        Regs::Reg(reg)
                                    };
                                    asms.push(Asm::BinOpImm(op, newreg, Regs::Reg(reg1), *b));
                                }
                            }
                        }
                        VMExp::Add(a, b) | VMExp::Sub(a, b) | VMExp::Get(a, b) => {
                            self.use_idecl(a);
                            match &b {
                                IdImm::Id(b) => self.use_idecl(b),
                                IdImm::Int(_) => (),
                            }
                        }
                        VMExp::Shl(a, b) | VMExp::Shr(a, b) if used => {
                            let vbox1 = *self
                                .var2reg
                                .get(a)
                                .unwrap_or_else(|| panic!("Not Found in var2reg: {a}"));
                            let reg1 = self.give_ireg(&mut asms, vbox1, Some(a));
                            self.use_idecl(a);
                            let newreg = self.ialloc(&mut asms, Some(var));

                            let op = match exp {
                                VMExp::Shl(_, _) => BinOpKind::Shl,
                                VMExp::Shr(_, _) => BinOpKind::Shr,
                                _ => unreachable!(),
                            };

                            asms.push(Asm::BinOpImm(op, Regs::Reg(newreg), Regs::Reg(reg1), *b));
                        }
                        VMExp::Shl(a, _) | VMExp::Shr(a, _) if used => {
                            self.use_idecl(a);
                        }
                        VMExp::FAdd(a, b)
                        | VMExp::FSub(a, b)
                        | VMExp::FMul(a, b)
                        | VMExp::FDiv(a, b)
                        | VMExp::FEql(a, b)
                        | VMExp::FLeq(a, b) if used => {
                            let vbox1 = *self
                                .var2reg
                                .get(a)
                                .unwrap_or_else(|| panic!("Not Found in var2reg: {a}"));
                            let vbox2 = *self
                                .var2reg
                                .get(b)
                                .unwrap_or_else(|| panic!("Not Found in var2reg: {b}"));
                            let reg1 = self.give_freg(&mut asms, vbox1, Some(a));
                            let reg2 = self.give_freg(&mut asms, vbox2, Some(b));

                            self.use_fdecl(a);
                            self.use_fdecl(b);
                            let op = match exp {
                                VMExp::FAdd(_, _) => BinOpKind::FAdd,
                                VMExp::FSub(_, _) => BinOpKind::FSub,
                                VMExp::FMul(_, _) => BinOpKind::FMul,
                                VMExp::FDiv(_, _) => BinOpKind::FDiv,
                                VMExp::FEql(_, _) => BinOpKind::FEql,
                                VMExp::FLeq(_, _) => BinOpKind::FLeq,
                                _ => unreachable!(),
                            };

                            match exp {
                                VMExp::FAdd(_, _)
                                | VMExp::FSub(_, _)
                                | VMExp::FMul(_, _)
                                | VMExp::FDiv(_, _) => {
                                    let newreg = self.falloc(&mut asms, Some(var));
                                    self.var2reg.insert(var.to_string(), ValueBox::FReg(newreg));
                                    self.freg2var.insert(newreg, var.to_string());
                                    asms.push(Asm::BinOp(
                                        op,
                                        Regs::FReg(newreg),
                                        Regs::FReg(reg1),
                                        Regs::FReg(reg2),
                                    ));
                                }
                                VMExp::FEql(_, _) | VMExp::FLeq(_, _) => {
                                    let newreg = self.ialloc(&mut asms, Some(var));
                                    self.var2reg.insert(var.to_string(), ValueBox::Reg(newreg));
                                    self.reg2var.insert(newreg, var.to_string());
                                    asms.push(Asm::BinOp(
                                        op,
                                        Regs::Reg(newreg),
                                        Regs::FReg(reg1),
                                        Regs::FReg(reg2),
                                    ));
                                }
                                _ => unreachable!(),
                            };
                        }
                        VMExp::FAdd(a, b)
                        | VMExp::FSub(a, b)
                        | VMExp::FMul(a, b)
                        | VMExp::FDiv(a, b)
                        | VMExp::FEql(a, b)
                        | VMExp::FLeq(a, b) => {
                            self.use_fdecl(a);
                            self.use_fdecl(b);
                        }
                        VMExp::AppDir(func, vl) => {
                            // もともとの場所を記録し、使用カウント更新
                            let prev: Vec<(Option<ValueBox>, Type)> = vl
                                .iter()
                                .map(|v| {
                                    let prev = self.var2reg.get(v).copied();
                                    if let Some((ty, _)) = fndef.lvar.get(v) {
                                        if let Type::Float = ty {
                                            self.use_fdecl(v);
                                        } else {
                                            self.use_idecl(v);
                                        }
                                        (prev, ty.clone())
                                    } else {
                                        panic!();
                                    }
                                })
                                .collect();
                            // 生きている変数をすべてスタックに退避
                            // eprintln!("call {}: {:?}, {:?}", func, self.reg2var, self.freg2var);
                            let mut ir2v = HashMap::new();
                            let mut fr2v = HashMap::new();
                            swap(&mut self.reg2var, &mut ir2v);
                            swap(&mut self.freg2var, &mut fr2v);
                            ir2v.iter().for_each(|(_reg, v)| {
                                self.ivar_spill(&mut asms, v);
                            });
                            fr2v.iter().for_each(|(_reg, v)| {
                                self.fvar_spill(&mut asms, v);
                            });

                            self.set_arguments(&mut asms, prev, None);
                            asms.push(Asm::Call(func.to_string()));

                            self.free_reg = LOCAL_REG.into_iter().collect::<BTreeSet<Reg>>();
                            self.free_freg = LOCAL_FREG.into_iter().collect::<BTreeSet<FReg>>();

                            // 返り値はa0/fa0に保存されていますね
                            if let Some(Type::Func(_, retty)) = self.fntype.get(func) {
                                // eprintln!("retty: {:?}", retty);
                                match **retty {
                                    Type::Unit => (),
                                    Type::Float => {
                                        self.freg2var.insert(FReg::fa0, var.to_string());
                                        self.var2reg
                                            .insert(var.to_string(), ValueBox::FReg(FReg::fa0));
                                        self.free_freg.remove(&FReg::fa0);
                                    }
                                    _ => {
                                        self.reg2var.insert(Reg::a0, var.to_string());
                                        self.var2reg
                                            .insert(var.to_string(), ValueBox::Reg(Reg::a0));
                                        self.free_reg.remove(&Reg::a0);
                                    }
                                }
                            }
                        }
                        VMExp::AppCls(cls, vl) => {
                            // AppDirからコピペ
                            // もともとの場所を記録し、使用カウント更新
                            let prev: Vec<(Option<ValueBox>, Type)> = vl
                                .iter()
                                .map(|v| {
                                    let prev = self.var2reg.get(v).copied();
                                    if let Some((ty, _)) = fndef.lvar.get(v) {
                                        if let Type::Float = ty {
                                            self.use_fdecl(v);
                                        } else {
                                            self.use_idecl(v);
                                        }
                                        (prev, ty.clone())
                                    } else {
                                        panic!();
                                    }
                                })
                                .collect();
                            // クロージャを追加
                            let clsbox = *self.var2reg.get(cls).unwrap();
                            self.use_idecl(cls);

                            // 生きている変数をすべてスタックに退避
                            let mut ir2v = HashMap::new();
                            let mut fr2v = HashMap::new();
                            swap(&mut self.reg2var, &mut ir2v);
                            swap(&mut self.freg2var, &mut fr2v);
                            ir2v.iter().for_each(|(_reg, v)| {
                                self.ivar_spill(&mut asms, v);
                            });
                            fr2v.iter().for_each(|(_reg, v)| {
                                self.fvar_spill(&mut asms, v);
                            });

                            let clsreg = AsmEmitter::clsr;

                            asms.push(Asm::Mv(ValueBox::Mem(4, IorF::I), ValueBox::Reg(clsreg)));

                            self.set_arguments(&mut asms, prev, Some(clsbox));

                            // CALL CALL CALL
                            asms.push(Asm::CallCls);
                            // eprintln!("callcls {}: {:?}, {:?}", cls, self.reg2var, self.freg2var);

                            asms.push(Asm::Mv(ValueBox::Reg(clsreg), ValueBox::Mem(4, IorF::I)));

                            self.free_reg = LOCAL_REG.into_iter().collect();
                            self.free_freg = LOCAL_FREG.into_iter().collect();

                            // 返り値はa0/fa0に保存されていますね
                            if let Some((retty, _)) = fndef.lvar.get(var) {
                                // eprintln!("retty: {:?}", retty);
                                match *retty {
                                    Type::Unit => (),
                                    Type::Float => {
                                        self.freg2var.insert(FReg::fa0, var.to_string());
                                        self.var2reg
                                            .insert(var.to_string(), ValueBox::FReg(FReg::fa0));
                                        self.free_freg.remove(&FReg::fa0);
                                    }
                                    _ => {
                                        self.reg2var.insert(Reg::a0, var.to_string());
                                        self.var2reg
                                            .insert(var.to_string(), ValueBox::Reg(Reg::a0));
                                        self.free_reg.remove(&Reg::a0);
                                    }
                                }
                            }
                        }
                        VMExp::MakeCls(ClsDef {
                            label: cls,
                            freevar: vl,
                        }) => {
                            let map: Vec<Option<ValueBox>> = vl
                                .iter()
                                .map(|v| {
                                    if let Some(vbox) = self.var2reg.get(v) {
                                        let vbox = *vbox;
                                        match vbox {
                                            ValueBox::Reg(_)
                                            | ValueBox::Mem(_, IorF::I)
                                            | ValueBox::Cls(_, IorF::I) => {
                                                self.use_idecl(v);
                                            }
                                            ValueBox::FReg(_)
                                            | ValueBox::Mem(_, IorF::F)
                                            | ValueBox::Cls(_, IorF::F) => {
                                                self.use_fdecl(v);
                                            }
                                        }
                                        Some(vbox)
                                    } else {
                                        None
                                    }
                                })
                                .collect();

                            let newreg = self.ialloc(&mut asms, Some(var));

                            asms.push(Asm::MakeCls(newreg, cls.to_string(), map));
                        }
                        VMExp::Int(i) if used => {
                            let newreg = self.ialloc(&mut asms, Some(var));
                            asms.push(Asm::Li(newreg, *i));
                        }
                        VMExp::Float(f) if used => {
                            let newreg = self.falloc(&mut asms, Some(var));
                            asms.push(Asm::FLi(newreg, *f));
                        }
                        VMExp::Tuple(vl) => {
                            let hp = AsmEmitter::hp;
                            let itmp = AsmEmitter::itmp;
                            let ftmp = AsmEmitter::ftmp;
                            for (i, v) in vl.iter().enumerate() {
                                let (ty, _) = fndef.lvar.get(v).unwrap();
                                let vbox = self.var2reg.get(v).unwrap();
                                match ty {
                                    Type::Unit => {
                                        self.use_idecl(v);
                                        continue;
                                    }
                                    Type::Float => {
                                        let r = match vbox {
                                            ValueBox::FReg(r) => *r,
                                            ValueBox::Mem(_, IorF::F)
                                            | ValueBox::Cls(_, IorF::F) => {
                                                asms.push(Asm::Mv(ValueBox::FReg(ftmp), *vbox));
                                                ftmp
                                            }
                                            _ => unreachable!(),
                                        };
                                        asms.push(Asm::PutImm(hp, i as i32, Regs::FReg(r)));
                                        self.use_fdecl(v);
                                    }
                                    _ => {
                                        let r = match vbox {
                                            ValueBox::Reg(r) => *r,
                                            ValueBox::Mem(_, IorF::I)
                                            | ValueBox::Cls(_, IorF::I) => {
                                                asms.push(Asm::Mv(ValueBox::Reg(itmp), *vbox));
                                                itmp
                                            }
                                            _ => unreachable!(),
                                        };
                                        asms.push(Asm::PutImm(hp, i as i32, Regs::Reg(r)));
                                        self.use_idecl(v);
                                    }
                                }
                            }

                            let newreg = self.ialloc(&mut asms, Some(var));

                            asms.push(Asm::Mv(ValueBox::Reg(newreg), ValueBox::Reg(hp)));

                            asms.push(Asm::BinOpImm(
                                BinOpKind::Add,
                                Regs::Reg(hp),
                                Regs::Reg(hp),
                                vl.len() as i32 * 4,
                            ))
                        }
                        _ => (),
                    };
                }
                VMachine::RetVal(var) => {
                    if let Some((ty, _)) = fndef.lvar.get(var) {
                        match ty {
                            Type::Unit => asms.push(Asm::Ret(None)),
                            _ => {
                                if let Some(vbox) = self.var2reg.get(var) {
                                    asms.push(Asm::Ret(Some(*vbox)))
                                }
                            }
                        }
                        match ty {
                            Type::Unit => (),
                            Type::Float => self.use_fdecl(var),
                            _ => self.use_idecl(var),
                        }
                    }
                }
                VMachine::Beq(a, b, label) | VMachine::Bge(a, b, label) => {
                    let vbox1 = *self.var2reg.get(a).unwrap_or_else(|| {
                        panic!("Not Found in var2reg: {a}");
                    });
                    let vbox2 = *self.var2reg.get(b).unwrap_or_else(|| {
                        panic!("Not Found in var2reg: {b}");
                    });
                    let reg1 = self.give_ireg(&mut asms, vbox1, Some(a));
                    let reg2 = self.give_ireg(&mut asms, vbox2, Some(b));

                    let op = match code {
                        VMachine::Beq(_, _, _) => CmpKind::Eq,
                        VMachine::Bge(_, _, _) => CmpKind::Ge,
                        _ => unreachable!(),
                    };

                    asms.push(Asm::Branch(op, reg1, reg2, label.to_string()));

                    self.use_idecl(a);
                    self.use_idecl(b);

                    // counts setting
                    let br = label.strip_suffix("then").unwrap();
                    let ((ithin, fthin), (ielin, felin)) = self.if_counts.get(br).unwrap();
                    let (ithen, ielse, ifinal) =
                        Self::create_branch_counts(&self.icounts, (ithin, ielin));
                    let (fthen, felse, ffinal) =
                        Self::create_branch_counts(&self.fcounts, (fthin, felin));

                    // eprintln!("then: {:?} {:?}", ithen, fthen);
                    // eprintln!("else: {:?} {:?}", ielse, felse);
                    // eprintln!("final: {:?} {:?}", ifinal, ffinal);

                    self.icounts = ielse;
                    self.fcounts = felse;

                    count_stack.push((ifinal, ffinal));
                    count_stack.push((ithen, fthen));

                    // regmap, varmapも保存
                    regmap_stack.push((self.reg2var.clone(), self.freg2var.clone()));
                    varmap_stack.push(self.var2reg.clone());
                    free_stack.push((self.free_reg.clone(), self.free_freg.clone()));

                    // spilledも保存
                    spill_stack.push(self.spilled.clone());
                    spcnt_stack.push(self.spill_count);
                }
                VMachine::Beqz(a, label) | VMachine::Bnez(a, label) => {
                    let vbox1 = *self.var2reg.get(a).unwrap_or_else(|| {
                        panic!("Not Found in var2reg: {a}");
                    });
                    let reg1 = self.give_ireg(&mut asms, vbox1, Some(a));
                    let reg2 = Reg::zero;

                    let op = match code {
                        VMachine::Beqz(_, _) => CmpKind::Eq,
                        VMachine::Bnez(_, _) => CmpKind::Ne,
                        _ => unreachable!(),
                    };

                    asms.push(Asm::Branch(op, reg1, reg2, label.to_string()));

                    self.use_idecl(a);

                    // counts setting
                    let br = label.strip_suffix("then").unwrap();
                    let ((ithin, fthin), (ielin, felin)) = self.if_counts.get(br).unwrap();
                    let (ithen, ielse, ifinal) =
                        Self::create_branch_counts(&self.icounts, (ithin, ielin));
                    let (fthen, felse, ffinal) =
                        Self::create_branch_counts(&self.fcounts, (fthin, felin));

                    // eprintln!("then: {:?} {:?}", ithen, fthen);
                    // eprintln!("else: {:?} {:?}", ielse, felse);
                    // eprintln!("final: {:?} {:?}", ifinal, ffinal);

                    self.icounts = ielse;
                    self.fcounts = felse;

                    count_stack.push((ifinal, ffinal));
                    count_stack.push((ithen, fthen));

                    // regmap, varmapも保存
                    regmap_stack.push((self.reg2var.clone(), self.freg2var.clone()));
                    varmap_stack.push(self.var2reg.clone());
                    free_stack.push((self.free_reg.clone(), self.free_freg.clone()));

                    // spilledも保存
                    spill_stack.push(self.spilled.clone());
                    spcnt_stack.push(self.spill_count);
                }
                VMachine::Label(label) => {
                    if label.ends_with("then") {
                        (self.icounts, self.fcounts) = count_stack.pop().unwrap();
                        (self.reg2var, self.freg2var) = regmap_stack.pop().unwrap();
                        swap(&mut self.var2reg, varmap_stack.last_mut().unwrap());
                        (self.free_reg, self.free_freg) = free_stack.pop().unwrap();

                        let mut spilled = self.spilled.clone();
                        swap(&mut spilled, spill_stack.last_mut().unwrap());
                        for (k, &(oft, _)) in &spilled {
                            if !self.spilled.contains_key(k) {
                                self.spilled.insert(k.clone(), (oft, false));
                            }
                        }
                        self.spilled = spilled;

                        swap(&mut self.spill_count, spcnt_stack.last_mut().unwrap());
                    } else if label.ends_with("final") {
                        // ifの後合流する場合
                        // else節に合わせるしかなくね？
                        (self.icounts, self.fcounts) = count_stack.pop().unwrap();
                        let else_varmap = varmap_stack.pop().unwrap();

                        let map: Vec<(ValueBox, ValueBox)> = self
                            .var2reg
                            .iter()
                            .filter_map(|(v, vbox1)| {
                                if let Some(vbox2) = else_varmap.get(v) {
                                    Some((*vbox1, *vbox2))
                                } else {
                                    None
                                }
                            })
                            .collect();

                        self.set_parallel(&mut asms, map);

                        self.var2reg = else_varmap;
                        (self.reg2var, self.freg2var) = Self::contruct_regmap(&self.var2reg);

                        self.free_reg = LOCAL_REG.into_iter().collect();
                        self.free_freg = LOCAL_FREG.into_iter().collect();
                        for reg in self.reg2var.keys() {
                            self.free_reg.remove(reg);
                        }
                        for reg in self.freg2var.keys() {
                            self.free_freg.remove(reg);
                        }

                        // 基本的にはelse節に合わせる
                        // then節でspillされているものがあれば、そのオフセットを保存
                        let mut else_spill = spill_stack.pop().unwrap();
                        for (k, &(oft, _)) in &self.spilled {
                            if !else_spill.contains_key(k) {
                                else_spill.insert(k.clone(), (oft, false));
                            }
                        }
                        self.spilled = else_spill;

                        let else_spcnt = spcnt_stack.pop().unwrap();
                        self.spill_count = self.spill_count.max(else_spcnt);
                    }
                    asms.push(Asm::Label(label.to_string()));
                }
                VMachine::Put(arr, idx, var) => {
                    let abox = *self.var2reg.get(arr).unwrap_or_else(|| {
                        panic!("Not Found in var2reg: {arr}");
                    });
                    let areg = self.give_ireg(&mut asms, abox, Some(arr));

                    let vreg = if let Some((Type::Float, _)) = fndef.lvar.get(var) {
                        let vbox = *self.var2reg.get(var).unwrap_or_else(|| {
                            panic!("Not Found in var2reg: {var}");
                        });
                        let vreg = self.give_freg(&mut asms, vbox, Some(var));
                        Regs::FReg(vreg)
                    } else {
                        let vbox = *self.var2reg.get(var).unwrap_or_else(|| {
                            panic!("Not Found in var2reg: {var}");
                        });
                        let vreg = self.give_ireg(&mut asms, vbox, Some(var));
                        Regs::Reg(vreg)
                    };

                    match idx {
                        IdImm::Id(idx) => {
                            let idxbox = *self.var2reg.get(idx).unwrap_or_else(|| {
                                panic!("Not Found in var2reg: {idx}");
                            });
                            let idxreg = self.give_ireg(&mut asms, idxbox, Some(idx));
                            self.use_idecl(idx);

                            asms.push(Asm::Put(areg, idxreg, vreg));
                        }
                        IdImm::Int(imm) => {
                            asms.push(Asm::PutImm(areg, *imm, vreg));
                        }
                    }

                    self.use_idecl(arr);

                    if let Regs::FReg(_) = vreg {
                        self.use_fdecl(var);
                    } else {
                        self.use_idecl(var);
                    }
                }
                VMachine::Jmp(label) => {
                    asms.push(Asm::Branch(
                        CmpKind::Eq,
                        Reg::zero,
                        Reg::zero,
                        label.to_string(),
                    ));
                }
            }
        }

        AsmFn {
            body: asms,
            name: fndef.name.clone(),
            args: exargs,
            freevar: fndef.freevar.clone(),
            spill_count: self.spill_count,
        }
    }

    pub fn reg_alloc(mut self, prog: &'a VMProg) -> AsmProg {
        let mut topfn = Vec::new();
        // eprintln!("func type{:?}", prog.fntype);
        self.fntype = prog.fntype.clone();
        for func in &prog.topfn {
            self.reset_regmap();
            self.is_closure = prog.closure_func.contains(&func.name.0);
            let res = self.regalloc_fn(func);
            topfn.push(res);
        }

        AsmProg {
            topfn,
            closure_func: prog.closure_func.clone(),
        }
    }
}

#[cfg(test)]
mod test {
    use super::ValueBox::Cls;
    use super::*;

    #[test]
    fn test_set_parallel_easy() {
        let map = vec![(ValueBox::Reg(Reg::t0), ValueBox::Reg(Reg::a0))];
        let mut alloc = RegisterAllocator::new();
        let mut asm = Vec::new();

        alloc.set_parallel(&mut asm, map);

        for code in asm {
            println!("easy {:?}", code);
        }
    }

    #[test]
    fn test_set_parallel_med() {
        let map = vec![
            (ValueBox::Reg(Reg::a2), ValueBox::Reg(Reg::a0)),
            (ValueBox::Reg(Reg::a0), ValueBox::Reg(Reg::a1)),
            (ValueBox::Reg(Reg::a1), ValueBox::Reg(Reg::a2)),
        ];
        let mut alloc = RegisterAllocator::new();
        let mut asm = Vec::new();

        alloc.set_parallel(&mut asm, map);

        for code in asm {
            println!("med {:?}", code);
        }
    }

    #[test]
    fn test_set_parallel_hard() {
        let map = vec![
            (ValueBox::Reg(Reg::a0), ValueBox::Reg(Reg::a1)),
            (ValueBox::Reg(Reg::a1), ValueBox::Reg(Reg::a2)),
            (ValueBox::Reg(Reg::a2), ValueBox::Reg(Reg::a3)),
            (ValueBox::Reg(Reg::a3), ValueBox::Reg(Reg::a0)),
            (ValueBox::Reg(Reg::a3), ValueBox::Reg(Reg::a4)),
        ];
        let mut alloc = RegisterAllocator::new();
        let mut asm = Vec::new();

        alloc.set_parallel(&mut asm, map);

        for code in asm {
            println!("hard {:?}", code);
        }
    }

    #[test]
    fn test_set_argument_cls() {
        let map = vec![
            (Some(ValueBox::Cls(4, IorF::I)), Type::Int),
            (Some(ValueBox::Cls(8, IorF::I)), Type::Int),
            (Some(ValueBox::Cls(12, IorF::I)), Type::Int),
            (Some(ValueBox::Cls(16, IorF::I)), Type::Int),
        ];
        let mut alloc = RegisterAllocator::new();
        let mut asm = Vec::new();

        alloc.set_arguments(&mut asm, map, Some(ValueBox::Reg(Reg::a0)));

        for code in asm {
            println!("cls {:?}", code);
        }
    }

    #[test]
    fn test_set_arguments_hard() {
        let map = vec![
            (Some(ValueBox::Reg(Reg::t1)), Type::Int),
            (Some(ValueBox::Reg(Reg::a2)), Type::Int),
            (Some(Cls(16, IorF::I)), Type::Int),
        ];
        let mut asm = Vec::new();
        let mut alloc = RegisterAllocator::new();

        alloc.set_arguments(&mut asm, map, Some(Cls(8, IorF::I)));

        for code in asm {
            println!("cls harder: {:?}", code);
        }
    }
}
