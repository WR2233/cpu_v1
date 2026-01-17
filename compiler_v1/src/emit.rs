use std::collections::HashMap;
use std::fs::File;
use std::io::BufWriter;
use std::io::Write;

use ordered_float::OrderedFloat;

use crate::Type;
use crate::asm::{ARG_FREG, ARG_REG, FReg, Reg};
use crate::vmachine::IdImm;
use crate::vmachine::VMExp;
use crate::vmachine::VMFn;
use crate::vmachine::VMProg;
use crate::vmachine::VMachine;

pub struct Emitter {
    float_table: HashMap<OrderedFloat<f32>, String>,
    emitting_main: bool,
    prog: VMProg,
    writer: BufWriter<File>,
}

impl Emitter {
    #[allow(non_upper_case_globals)]
    const hp: Reg = Reg::tp;
    pub fn new(prog: VMProg, f: File) -> Self {
        let writer = BufWriter::new(f);
        Self {
            float_table: HashMap::new(),
            emitting_main: false,
            prog,
            writer,
        }
    }

    pub fn run(&mut self) -> std::io::Result<()> {
        eprintln!("emitting assembly...");
        // self.emitting_main = true;
        // writeln!(self.writer, "main:")?;
        // // CLONE POLICE, OPEN UP!!!
        // let mainfn = VMFn {
        //     name: (
        //         "main".to_string(),
        //         Type::Func(vec![Type::Unit], Box::new(Type::Unit)),
        //     ),
        //     args: Vec::new(),
        //     freevar: Vec::new(),
        //     body: self.prog.body.clone(),
        //     lvar: self.prog.lvar.clone(),
        // };
        // let code = self.emit(mainfn);
        // write!(self.writer, "{}", code,)?;
        // write!(self.writer, "\tebreak\n")?;
        // self.emitting_main = true;
        // CLONE POLICE, OPEN UP!!!
        for f in self.prog.topfn.clone() {
            self.emitting_main = f.name.0 == "MAIN";
            writeln!(self.writer, "{}:", f.name.0)?;
            let code = self.emit(f);
            write!(self.writer, "{}", code)?;
        }
        if self.float_table.len() > 0 {
            writeln!(self.writer, ".data")?;
        }
        for (f, l) in &self.float_table {
            let int = f.to_bits();
            writeln!(self.writer, "{l}:\n\t.word {int}")?;
        }
        Ok(())
    }

    fn emit(&mut self, fndef: VMFn) -> String {
        // eprintln!("{:?}", fndef.lvar);
        let mut res = String::new();
        let lvar_oft = Emitter::local_var_oft(&fndef.lvar);
        let stack_frame_size = (lvar_oft.len() + 1) * 4;
        if stack_frame_size > 4095 {
            panic!("too large stack frame");
        }
        res += &format!("\taddi sp, sp, {}\n", -(stack_frame_size as i32));
        // arguments in register
        let mut regit = ARG_REG.iter();
        let mut fregit = ARG_FREG.iter();
        let mut stack_save_count = 0;
        let fname = &fndef.name.0;
        let is_closure = self.prog.closure_func.contains(fname);
        for (v, t) in &fndef.args {
            match t {
                Type::Float => {
                    if let Some(r) = fregit.next() {
                        res +=
                            &format!("\tfsw {:?}, {}(sp)\n", r, lvar_oft.get(v as &str).unwrap());
                    } else {
                        stack_save_count += 1;
                    }
                }
                _ => {
                    if let Some(r) = regit.next() {
                        res += &format!("\tsw {:?}, {}(sp)\n", r, lvar_oft.get(v as &str).unwrap());
                    } else {
                        stack_save_count += 1;
                    }
                }
            }
        }
        if is_closure {
            if let Some(r) = regit.next() {
                res += &format!(
                    "\tsw {:?}, {}(sp)\n",
                    r,
                    lvar_oft.get(fname as &str).unwrap()
                );
            } else {
                stack_save_count += 1;
            }
        }
        // arguments in stack
        if stack_save_count > 0 {
            eprintln!("arguments in stack");
            regit = ARG_REG.iter();
            fregit = ARG_FREG.iter();
            for (v, t) in &fndef.args {
                match t {
                    Type::Float => {
                        if let None = fregit.next() {
                            stack_save_count -= 1;
                            res += &format!(
                                "\tflw ft0, {}(sp)\n",
                                (lvar_oft.len() + stack_save_count) * 4
                            );
                            Emitter::store_fvar(&mut res, &lvar_oft, v, FReg::ft0);
                        }
                    }
                    _ => {
                        if let None = regit.next() {
                            stack_save_count -= 1;
                            res += &format!(
                                "\tlw t0, {}(sp)\n",
                                (lvar_oft.len() + stack_save_count) * 4
                            );
                            Emitter::store_var(&mut res, &lvar_oft, v, Reg::t0);
                        }
                    }
                }
            }
            if is_closure {
                if let None = regit.next() {
                    stack_save_count -= 1;
                    res += &format!("\tlw t0, {}(sp)\n", (lvar_oft.len() + stack_save_count) * 4);
                    Emitter::store_var(&mut res, &lvar_oft, fname, Reg::t0);
                }
            }
        }
        if fndef.freevar.len() > 0 {
            // if f is called by closure
            Emitter::load_var(&mut res, &lvar_oft, &fndef.name.0, Reg::t0);
            for (i, (fv, ty)) in fndef.freevar.iter().enumerate() {
                if let Type::Float = ty {
                    res += &format!("\tflw ft0, {}(t0)\n", (i + 1) * 4);
                    Emitter::store_fvar(&mut res, &lvar_oft, fv, FReg::ft0);
                } else {
                    res += &format!("\tlw t1, {}(t0)\n", (i + 1) * 4);
                    Emitter::store_var(&mut res, &lvar_oft, fv, Reg::t1);
                }
            }
        }

        for code in fndef.body {
            match code {
                VMachine::Let(v, exp, p) => {
                    let (st, en) = p;
                    res += &format!("# {}~{}\n", st.pos_lnum, en.pos_lnum);
                    match &exp {
                        VMExp::Unit => (),
                        VMExp::Int(i) => {
                            if *i >= 0x1000 {
                                res += &format!("\tlui t0, {}\n", i);
                                res += &format!("\taddi t0, t0, {}\n", i & 0x1fff);
                            } else {
                                res += &format!("\taddi t0, zero, {}\n", i);
                            }
                            Emitter::store_var(&mut res, &lvar_oft, &v, Reg::t0);
                        }
                        VMExp::Float(f) => {
                            let l = if let Some(s) = self.float_table.get(&OrderedFloat(*f)) {
                                s
                            } else {
                                let newl = format!(".f{:.6}f", f);
                                self.float_table.insert(OrderedFloat(*f), newl);
                                self.float_table.get(&OrderedFloat(*f)).unwrap()
                            };
                            res += &format!("\tla t0, {}\n", l);
                            res += &format!("\tflw ft0, 0(t0)\n");
                            Emitter::store_fvar(&mut res, &lvar_oft, &v, FReg::ft0);
                        }
                        VMExp::Add(a, b) | VMExp::Sub(a, b) => {
                            Emitter::load_var(&mut res, &lvar_oft, a, Reg::t0);
                            match b {
                                IdImm::Id(b) => {
                                    Emitter::load_var(&mut res, &lvar_oft, b, Reg::t1);
                                    match &exp {
                                        VMExp::Add(_, _) => res += &format!("\tadd t2, t0, t1\n"),
                                        VMExp::Sub(_, _) => res += &format!("\tsub t2, t0, t1\n"),
                                        _ => unreachable!(),
                                    }
                                }
                                IdImm::Int(i) if (-4096..4096).contains(i) => match &exp {
                                    VMExp::Add(_, _) => res += &format!("\taddi t2, t0, {}\n", i),
                                    VMExp::Sub(_, _) => res += &format!("\taddi t2, t0, {}\n", -i),
                                    _ => unreachable!(),
                                },
                                _ => panic!("too large immediate"),
                            }
                            Emitter::store_var(&mut res, &lvar_oft, &v, Reg::t2);
                        }
                        VMExp::Shl(a, b) | VMExp::Shr(a, b) => {
                            Emitter::load_var(&mut res, &lvar_oft, a, Reg::t0);
                            match &exp {
                                VMExp::Shl(_, _) => res += &format!("\tslli t2, t0, {}\n", b),
                                VMExp::Shr(_, _) => res += &format!("\tsrai t2, t0, {}\n", b),
                                _ => unreachable!(),
                            }
                            Emitter::store_var(&mut res, &lvar_oft, &v, Reg::t2);
                        }
                        VMExp::Neg(a) => {
                            Emitter::load_var(&mut res, &lvar_oft, a, Reg::t0);
                            res += &format!("\tsub t2, zero, t0\n");
                            Emitter::store_var(&mut res, &lvar_oft, &v, Reg::t2);
                        }
                        VMExp::FAdd(a, b)
                        | VMExp::FSub(a, b)
                        | VMExp::FMul(a, b)
                        | VMExp::FDiv(a, b) => {
                            Emitter::load_fvar(&mut res, &lvar_oft, a, FReg::ft0);
                            Emitter::load_fvar(&mut res, &lvar_oft, b, FReg::ft1);
                            match &exp {
                                VMExp::FAdd(_, _) => res += &format!("\tfadd ft2, ft0, ft1\n"),
                                VMExp::FSub(_, _) => res += &format!("\tfsub ft2, ft0, ft1\n"),
                                VMExp::FMul(_, _) => res += &format!("\tfmul ft2, ft0, ft1\n"),
                                VMExp::FDiv(_, _) => res += &format!("\tfdiv ft2, ft0, ft1\n"),
                                _ => unreachable!(),
                            };
                            Emitter::store_fvar(&mut res, &lvar_oft, &v, FReg::ft2);
                        }
                        VMExp::FNeg(a) => {
                            Emitter::load_fvar(&mut res, &lvar_oft, a, FReg::ft0);
                            res += &format!("\tfneg ft2, ft0\n");
                            Emitter::store_fvar(&mut res, &lvar_oft, &v, FReg::ft2);
                        }
                        VMExp::FEql(a, b) | VMExp::FLeq(a, b) => {
                            Emitter::load_fvar(&mut res, &lvar_oft, a, FReg::ft0);
                            Emitter::load_fvar(&mut res, &lvar_oft, b, FReg::ft1);
                            match &exp {
                                VMExp::FEql(_, _) => res += &format!("\tfeq t2, ft0, ft1\n"),
                                VMExp::FLeq(_, _) => res += &format!("\tfle t2, ft0, ft1\n"),
                                _ => unreachable!(),
                            };
                            Emitter::store_var(&mut res, &lvar_oft, &v, Reg::t2);
                        }
                        VMExp::Var(src) => match fndef.lvar.get(src) {
                            Some((Type::Float, _)) => {
                                Emitter::load_fvar(&mut res, &lvar_oft, src, FReg::ft0);
                                Emitter::store_fvar(&mut res, &lvar_oft, &v, FReg::ft0);
                            }
                            Some((Type::Unit, _)) => (),
                            _ => {
                                Emitter::load_var(&mut res, &lvar_oft, src, Reg::t0);
                                Emitter::store_var(&mut res, &lvar_oft, &v, Reg::t0);
                            }
                        },
                        VMExp::Get(arr, oft) => {
                            Emitter::load_var(&mut res, &lvar_oft, &arr, Reg::t0);
                            match fndef.lvar.get(&v) {
                                Some((Type::Float, _)) => {
                                    match oft {
                                        IdImm::Int(i) => {
                                            res += &format!("\tflw ft0, {}(t0)\n", i * 4);
                                        }
                                        IdImm::Id(idx) => {
                                            Emitter::load_var(&mut res, &lvar_oft, &idx, Reg::t1);
                                            res += &format!("\tslli t1, t1, 2\n");
                                            res += &format!("\tadd t1, t1, t0\n");
                                            res += &format!("\tflw ft0, 0(t1)\n");
                                        }
                                    }
                                    Emitter::store_fvar(&mut res, &lvar_oft, &v, FReg::ft0);
                                }
                                _ => {
                                    match oft {
                                        IdImm::Int(i) => {
                                            res += &format!("\tlw t2, {}(t0)\n", i * 4);
                                        }
                                        IdImm::Id(idx) => {
                                            Emitter::load_var(&mut res, &lvar_oft, &idx, Reg::t1);
                                            res += &format!("\tslli t1, t1, 2\n");
                                            res += &format!("\tadd t1, t1, t0\n");
                                            res += &format!("\tlw t2, 0(t1)\n");
                                        }
                                    }
                                    Emitter::store_var(&mut res, &lvar_oft, &v, Reg::t2);
                                }
                            }
                        }
                        VMExp::AppDir(f, args) | VMExp::AppCls(f, args) => {
                            let mut regit = ARG_REG.iter();
                            let mut fregit = ARG_FREG.iter();
                            let mut stack_save = 0;
                            res += "\tsw ra, 0(sp)\n";
                            // arguments
                            for arg in args {
                                if let Some((Type::Float, _)) = fndef.lvar.get(arg) {
                                    if let Some(reg) = fregit.next() {
                                        Emitter::load_fvar(&mut res, &lvar_oft, arg, *reg);
                                    } else {
                                        // stack save
                                        stack_save += 1;
                                        Emitter::load_fvar(&mut res, &lvar_oft, arg, FReg::ft0);
                                        res += &format!("\tfsw ft0, {}(sp)\n", -(stack_save + 1) * 4);
                                    }
                                } else {
                                    if let Some(reg) = regit.next() {
                                        Emitter::load_var(&mut res, &lvar_oft, arg, *reg);
                                    } else {
                                        // stack save
                                        stack_save += 1;
                                        Emitter::load_var(&mut res, &lvar_oft, arg, Reg::t0);
                                        res += &format!("\tsw t0, {}(sp)\n", -(stack_save + 1) * 4);
                                    }
                                }
                            }
                            if let VMExp::AppCls(_, _) = &exp {
                                // 自分自身を呼び出すときは、新しくクロージャを作らずに、引数で与えられたものを再利用する
                                // ...ようにしないとねぇ
                                // クロージャ経由で呼び出されたとき(というか自分が自由変数をもっているとき)は、引数で渡されたクロージャをローカル変数に保存しておこう！
                                if let Some(reg) = regit.next() {
                                    Emitter::load_var(&mut res, &lvar_oft, f, *reg);
                                } else {
                                    // stack save
                                    stack_save += 1;
                                    Emitter::load_var(&mut res, &lvar_oft, f, Reg::t0);
                                    res += &format!("\tsw t0, {}(sp)\n", -stack_save * 4);
                                }
                                Emitter::load_var(&mut res, &lvar_oft, f, Reg::t0);
                                res += "\tlw t0, 0(t0)\n";
                            }
                            assert_eq!(stack_save, 0);
                            // res += &format!("\taddi sp, sp, {}\n", -stack_save * 4);

                            match &exp {
                                VMExp::AppDir(_, _) => {
                                    res += &format!("\tjal ra, {}\n", f);
                                }
                                VMExp::AppCls(_, _) => {
                                    res += &format!("\tjalr ra, t0, 0\n");
                                }
                                _ => unreachable!(),
                            }
                            // res += &format!("\taddi sp, sp, {}\n", stack_save * 4);
                            res += "\tlw ra, 0(sp)\n";

                            if let Some((Type::Float, _)) = fndef.lvar.get(&v) {
                                Emitter::store_fvar(&mut res, &lvar_oft, &v, FReg::fa0);
                            } else {
                                Emitter::store_var(&mut res, &lvar_oft, &v, Reg::a0);
                            }
                        }
                        VMExp::Tuple(vs) => {
                            for (i, var) in vs.iter().enumerate() {
                                if let Some((Type::Float, _)) = fndef.lvar.get(var) {
                                    Emitter::load_fvar(&mut res, &lvar_oft, var, FReg::ft0);
                                    res += &format!("\tfsw ft0, {}({:?})\n", i * 4, Emitter::hp);
                                } else {
                                    Emitter::load_var(&mut res, &lvar_oft, var, Reg::t0);
                                    res += &format!("\tsw t0, {}({:?})\n", i * 4, Emitter::hp);
                                }
                            }
                            Emitter::store_var(&mut res, &lvar_oft, &v, Emitter::hp);
                            res +=
                                &format!("\taddi {0:?}, {0:?}, {1}\n", Emitter::hp, vs.len() * 4);
                        }
                        VMExp::MakeCls(cldef) => {
                            let l = &cldef.label;
                            let fvar = &cldef.freevar;

                            Emitter::store_var(&mut res, &lvar_oft, &v, Emitter::hp);
                            res += &format!("\tla t0, {}\n", l);
                            res += &format!("\tsw t0, 0({:?})\n", Emitter::hp);
                            for (i, fv) in fvar.iter().enumerate() {
                                if let Some((Type::Float, _)) = fndef.lvar.get(fv) {
                                    Emitter::load_fvar(&mut res, &lvar_oft, fv, FReg::ft0);
                                    res +=
                                        &format!("\tfsw ft0, {}({:?})\n", (i + 1) * 4, Emitter::hp);
                                } else {
                                    Emitter::load_var(&mut res, &lvar_oft, fv, Reg::t0);
                                    res +=
                                        &format!("\tsw t0, {}({:?})\n", (i + 1) * 4, Emitter::hp);
                                }
                            }
                            res += &format!(
                                "\taddi {0:?}, {0:?}, {1}\n",
                                Emitter::hp,
                                (fvar.len() + 1) * 4
                            );
                        }
                        // VMExp::ExtArray(arr) => {
                        //     res += &format!("\tla t0, {arr}\n");
                        //     Emitter::store_var(&mut res, &lvar_oft, &v, Reg::t0);
                        // }
                    }
                }
                VMachine::Label(l) => res += &format!("{}:\n", l),
                VMachine::RetVal(v) => {
                    if let Some((Type::Float, _)) = fndef.lvar.get(&v) {
                        Emitter::load_fvar(&mut res, &lvar_oft, &v, FReg::fa0);
                    } else {
                        Emitter::load_var(&mut res, &lvar_oft, &v, Reg::a0);
                    }
                    res += &format!("\taddi sp, sp, {}\n", stack_frame_size);
                    if self.emitting_main {
                        res += "\tebreak\n";
                    } else {
                        res += "\tret\n"
                    }
                }
                VMachine::Beq(a, b, l) => {
                    Emitter::load_var(&mut res, &lvar_oft, &a, Reg::t0);
                    Emitter::load_var(&mut res, &lvar_oft, &b, Reg::t1);
                    res += &format!("\tbeq t0, t1, {}\n", l);
                }
                VMachine::Bge(a, b, l) => {
                    Emitter::load_var(&mut res, &lvar_oft, &a, Reg::t0);
                    Emitter::load_var(&mut res, &lvar_oft, &b, Reg::t1);
                    res += &format!("\tbge t0, t1, {}\n", l);
                }
                VMachine::Beqz(a, l) => {
                    Emitter::load_var(&mut res, &lvar_oft, &a, Reg::t0);
                    res += &format!("\tbeq t0, zero, {}\n", l);
                }
                VMachine::Bnez(a, l) => {
                    Emitter::load_var(&mut res, &lvar_oft, &a, Reg::t0);
                    res += &format!("\tbne t0, zero, {}\n", l);
                }
                VMachine::Jmp(l) => {
                    res += &format!("\tbeq zero, zero, {}\n", l);
                }
                VMachine::Put(arr, oft, v) => {
                    Emitter::load_var(&mut res, &lvar_oft, &arr, Reg::t0);
                    match fndef.lvar.get(&v) {
                        Some((Type::Float, _)) => {
                            Emitter::load_fvar(&mut res, &lvar_oft, &v, FReg::ft0);
                            match oft {
                                IdImm::Int(i) => {
                                    res += &format!("\tfsw ft0, {}(t0)\n", i * 4);
                                }
                                IdImm::Id(idx) => {
                                    Emitter::load_var(&mut res, &lvar_oft, &idx, Reg::t1);
                                    res += &format!("\tslli t1, t1, 2\n");
                                    res += &format!("\tadd t1, t1, t0\n");
                                    res += &format!("\tfsw ft0, 0(t1)\n");
                                }
                            }
                        }
                        _ => {
                            Emitter::load_var(&mut res, &lvar_oft, &v, Reg::t2);
                            match oft {
                                IdImm::Int(i) => {
                                    res += &format!("\tsw t2, {}(t0)\n", i * 4);
                                }
                                IdImm::Id(idx) => {
                                    Emitter::load_var(&mut res, &lvar_oft, &idx, Reg::t1);
                                    res += &format!("\tslli t1, t1, 2\n");
                                    res += &format!("\tadd t1, t1, t0\n");
                                    res += &format!("\tsw t2, 0(t1)\n");
                                }
                            }
                        }
                    }
                }
            }
        }

        // res += &format!("\taddi sp, sp, {}\n", lvar_oft.len() * 4);
        res
    }

    fn local_var_oft(lvar: &HashMap<String, (Type, Option<i32>)>) -> HashMap<&str, usize> {
        let mut res = HashMap::new();
        for (i, k) in lvar.keys().enumerate() {
            res.insert(k as &str, (i + 1) * 4);
        }
        res
    }

    fn load_var(asm: &mut String, lvar_oft: &HashMap<&str, usize>, var: &str, reg: Reg) {
        *asm += &format!(
            "\tlw {:?}, {}(sp)\n",
            reg,
            lvar_oft.get(&var as &str).unwrap_or_else(|| {
                eprintln!("{var}");
                panic!()
            })
        );
    }

    fn load_fvar(asm: &mut String, lvar_oft: &HashMap<&str, usize>, var: &str, reg: FReg) {
        *asm += &format!(
            "\tflw {:?}, {}(sp)\n",
            reg,
            lvar_oft.get(&var as &str).unwrap_or_else(|| {
                eprintln!("{var}");
                panic!()
            })
        );
    }

    fn store_var(asm: &mut String, lvar_oft: &HashMap<&str, usize>, var: &str, reg: Reg) {
        *asm += &format!(
            "\tsw {:?}, {}(sp)\n",
            reg,
            lvar_oft.get(&var as &str).unwrap_or_else(|| {
                eprintln!("{}", var);
                panic!()
            })
        );
    }

    fn store_fvar(asm: &mut String, lvar_oft: &HashMap<&str, usize>, var: &str, freg: FReg) {
        *asm += &format!(
            "\tfsw {:?}, {}(sp)\n",
            freg,
            lvar_oft.get(&var as &str).unwrap_or_else(|| {
                eprintln!("{}", var);
                panic!()
            })
        );
    }
}
