use crate::SymbolPos;
use crate::Type;
use crate::Var;
use crate::closure::Closure;
use crate::closure::ClosureInner;
use crate::closure::ClsDef;
use crate::closure::Prog;
use core::panic;
use std::collections::HashMap;
use std::collections::HashSet;
use std::fmt::Display;

#[derive(Debug, Clone)]
pub struct VMFn {
    pub name: Var,
    pub args: Vec<Var>,
    pub freevar: Vec<Var>,
    pub body: Vec<VMachine>,
    pub lvar: HashMap<String, (Type, Option<i32>)>,
}

#[derive(Debug, Clone)]
pub struct VMProg {
    pub topfn: Vec<VMFn>,
    pub fntype: HashMap<String, Type>,
    pub closure_func: HashSet<String>,
    branch_counter: usize,
}

#[derive(Debug, Clone)]
pub enum IdImm {
    Id(String),
    Int(i32),
}

#[derive(Debug, Clone)]
pub enum VMachine {
    Let(String, VMExp, SymbolPos),
    RetVal(String),
    Label(String),
    Beq(String, String, String), // (var1, var2, label)
    Bge(String, String, String), // (var1, var2, label)
    Beqz(String, String),        // (var, label)
    Bnez(String, String),        // (var, label)
    Jmp(String),                 // (label)
    Put(String, IdImm, String),  // (Array, offset, var)
}

#[derive(Debug, Clone)]
pub enum VMExp {
    Unit,
    Int(i32),
    Float(f32),
    Neg(String),
    Add(String, IdImm),
    Sub(String, IdImm),
    Shl(String, i32),
    Shr(String, i32),
    FNeg(String),
    FAdd(String, String),
    FSub(String, String),
    FMul(String, String),
    FDiv(String, String),
    FEql(String, String),
    FLeq(String, String),
    MakeCls(ClsDef),
    AppDir(String, Vec<String>),
    AppCls(String, Vec<String>),
    Var(String), // 主にifの値用
    Tuple(Vec<String>),
    Get(String, IdImm),
}

fn is_imm(m: &HashMap<String, (Type, Option<i32>)>, var: &str) -> Option<i32> {
    if let Some((Type::Int, Some(i))) = m.get(var) {
        Some(*i)
    } else {
        None
    }
}

impl VMProg {
    pub fn from(prog: Prog) -> Self {
        let mut fnty = HashMap::new();
        // external function
        fnty.insert(
            "min_caml_print_int".to_string(),
            Type::Func(vec![Type::Int], Box::new(Type::Unit)),
        );
        fnty.insert(
            "min_caml_print_byte".to_string(),
            Type::Func(vec![Type::Int], Box::new(Type::Unit)),
        );
        fnty.insert(
            "min_caml_print_float".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Unit)),
        );
        fnty.insert(
            "min_caml_print_newline".to_string(),
            Type::Func(vec![Type::Unit], Box::new(Type::Unit)),
        );
        fnty.insert(
            "min_caml_read_int".to_string(),
            Type::Func(vec![Type::Unit], Box::new(Type::Int)),
        );
        fnty.insert(
            "min_caml_read_float".to_string(),
            Type::Func(vec![Type::Unit], Box::new(Type::Float)),
        );
        fnty.insert(
            "min_caml_read_byte".to_string(),
            Type::Func(vec![Type::Unit], Box::new(Type::Int)),
        );
        fnty.insert(
            "min_caml_truncate".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Int)),
        );
        fnty.insert(
            "min_caml_create_array".to_string(),
            Type::Func(
                vec![Type::Int, Type::Int],
                Box::new(Type::Array(Box::new(Type::Int))),
            ),
        );
        fnty.insert(
            "min_caml_create_float_array".to_string(),
            Type::Func(
                vec![Type::Int, Type::Float],
                Box::new(Type::Array(Box::new(Type::Float))),
            ),
        );
        fnty.insert(
            "min_caml_sin".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Float)),
        );
        fnty.insert(
            "min_caml_cos".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Float)),
        );
        fnty.insert(
            "min_caml_tan".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Float)),
        );
        fnty.insert(
            "min_caml_atan".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Float)),
        );
        fnty.insert(
            "min_caml_abs_float".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Float)),
        );
        fnty.insert(
            "min_caml_floor".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Float)),
        );
        fnty.insert(
            "min_caml_sqrt".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Float)),
        );
        fnty.insert(
            "min_caml_float_of_int".to_string(),
            Type::Func(vec![Type::Int], Box::new(Type::Float)),
        );
        fnty.insert(
            "min_caml_int_of_float".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Int)),
        );
        fnty.insert(
            "min_caml_fequal".to_string(),
            Type::Func(vec![Type::Float, Type::Float], Box::new(Type::Int)),
        );
        fnty.insert(
            "min_caml_fless".to_string(),
            Type::Func(vec![Type::Float, Type::Float], Box::new(Type::Int)),
        );
        fnty.insert(
            "min_caml_fispos".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Int)),
        );
        fnty.insert(
            "min_caml_fisneg".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Int)),
        );
        fnty.insert(
            "min_caml_fiszero".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Int)),
        );
        fnty.insert(
            "min_caml_xor".to_string(),
            Type::Func(vec![Type::Int, Type::Int], Box::new(Type::Int)),
        );
        fnty.insert(
            "min_caml_not".to_string(),
            Type::Func(vec![Type::Int], Box::new(Type::Int)),
        );
        fnty.insert(
            "min_caml_fhalf".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Float)),
        );
        fnty.insert(
            "min_caml_fsqr".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Float)),
        );
        fnty.insert(
            "min_caml_fabs".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Float)),
        );
        fnty.insert(
            "min_caml_fneg".to_string(),
            Type::Func(vec![Type::Float], Box::new(Type::Float)),
        );
        fnty.insert(
            "min_caml_print_char".to_string(),
            Type::Func(vec![Type::Int], Box::new(Type::Unit)),
        );
        // toplevel function
        for func in &prog.topfn {
            fnty.insert(func.name.0.clone(), func.name.1.clone());
        }

        let mut res = VMProg {
            topfn: Vec::new(),
            fntype: fnty,
            closure_func: HashSet::new(),
            branch_counter: 0,
        };

        let mut vmcode = Vec::new();
        let mut map = HashMap::new();
        res.virtual_assemble(&mut vmcode, &mut map, prog.body, None);

        let main = VMFn {
            name: (
                "MAIN".to_string(),
                Type::Func(vec![Type::Unit], Box::new(Type::Unit)),
            ),
            args: Vec::new(),
            freevar: Vec::new(),
            body: vmcode,
            lvar: map,
        };

        res.topfn.push(main);

        for func in prog.topfn {
            // eprintln!("[FUNC] {:?} {:?} {:?}", func.name, func.args, func.freevar);
            let mut vmcode = Vec::new();
            let mut map = HashMap::new();
            for (v, t) in func.args.iter().chain(func.freevar.iter()) {
                map.insert(v.clone(), (t.clone(), None));
            }
            if true {
                // この関数はクロージャを経由して呼ばれるので、クロージャのアドレスを保存しておこう！
                map.insert(func.name.0.clone(), (func.name.1.clone(), None));
            }
            res.virtual_assemble(&mut vmcode, &mut map, func.body, None);
            // for code in &vmcode {
            //     eprintln!("{:?}", code);
            // }
            let fdef = VMFn {
                name: func.name,
                args: func.args,
                freevar: func.freevar,
                body: vmcode,
                lvar: map,
            };
            res.topfn.push(fdef);
        }
        res
    }

    fn virtual_assemble(
        &mut self,
        inst_vec: &mut Vec<VMachine>,
        m: &mut HashMap<String, (Type, Option<i32>)>,
        cls: Closure,
        parent: Option<String>,
    ) {
        let exp = match cls.0 {
            ClosureInner::Let((var, ty), inner, exp) => {
                m.insert(var.clone(), (ty, None));
                self.virtual_assemble(inst_vec, m, *inner, Some(var));
                self.virtual_assemble(inst_vec, m, *exp, parent.clone());
                None
            }
            ClosureInner::LetTuple(v, tup, e) => {
                for (i, (n, t)) in v.into_iter().enumerate() {
                    m.insert(n.clone(), (t, None));
                    inst_vec.push(VMachine::Let(
                        n,
                        VMExp::Get(tup.clone(), IdImm::Int(i as i32)),
                        cls.1.clone(),
                    ));
                }
                self.virtual_assemble(inst_vec, m, *e, parent.clone());
                None
            }
            ClosureInner::Unit => Some(VMExp::Unit),
            ClosureInner::Int(n) => Some(VMExp::Int(n)),
            ClosureInner::Float(f) => Some(VMExp::Float(f)),
            ClosureInner::Neg(v) => Some(VMExp::Neg(v)),
            ClosureInner::Add(a, b) => {
                let res = if let Some(i) = is_imm(m, &a) {
                    if -4096 <= i && i <= 4095 {
                        VMExp::Add(b, IdImm::Int(i))
                    } else {
                        VMExp::Add(a, IdImm::Id(b))
                    }
                } else if let Some(i) = is_imm(m, &b) {
                    if -4096 <= i && i <= 4095 {
                        VMExp::Add(a, IdImm::Int(i))
                    } else {
                        VMExp::Add(a, IdImm::Id(b))
                    }
                } else {
                    VMExp::Add(a, IdImm::Id(b))
                };
                Some(res)
            }
            ClosureInner::Sub(a, b) => Some(if let Some(i) = is_imm(m, &b) {
                VMExp::Sub(a, IdImm::Int(i))
            } else {
                VMExp::Sub(a, IdImm::Id(b))
            }),
            ClosureInner::Shl(a, i) => Some(VMExp::Shl(a, i)),
            ClosureInner::Shr(a, i) => Some(VMExp::Shr(a, i)),
            ClosureInner::FNeg(v) => Some(VMExp::FNeg(v)),
            ClosureInner::FAdd(a, b) => Some(VMExp::FAdd(a, b)),
            ClosureInner::FSub(a, b) => Some(VMExp::FSub(a, b)),
            ClosureInner::FMul(a, b) => Some(VMExp::FMul(a, b)),
            ClosureInner::FDiv(a, b) => Some(VMExp::FDiv(a, b)),
            ClosureInner::IfEq(a, b, x, y) => {
                match m.get(&a) {
                    Some((ty, _)) => {
                        let branch_num = self.new_branch();
                        let thenl = format!("._{}_then", branch_num); // then label
                        let finall = format!("._{}_final", branch_num); // final label
                        match ty {
                            Type::Int => {
                                inst_vec.push(VMachine::Beq(a, b, thenl.clone()));
                            }
                            Type::Float => {
                                let newvar = format!("_{}_tmp", branch_num);
                                m.insert(newvar.clone(), (Type::Float, None));
                                inst_vec.push(VMachine::Let(
                                    newvar.clone(),
                                    VMExp::FEql(a, b),
                                    cls.1.clone(),
                                )); // batting !
                                inst_vec.push(VMachine::Bnez(newvar, thenl.clone()));
                            }
                            _ => panic!(),
                        };
                        self.virtual_assemble(inst_vec, m, *y, parent.clone());
                        inst_vec.push(VMachine::Jmp(finall.clone()));
                        inst_vec.push(VMachine::Label(thenl));
                        self.virtual_assemble(inst_vec, m, *x, parent.clone());
                        inst_vec.push(VMachine::Label(finall));
                    }
                    _ => panic!(),
                }
                None
            }
            ClosureInner::IfLe(a, b, x, y) => {
                match m.get(&a) {
                    Some((ty, _)) => {
                        let branch_num = self.new_branch();
                        let thenl = format!("._{}_then", branch_num); // then label
                        let finall = format!("._{}_final", branch_num); // final label
                        match ty {
                            Type::Int => {
                                inst_vec.push(VMachine::Bge(b, a, thenl.clone()));
                            }
                            Type::Float => {
                                let newvar = format!("_{}_tmp", branch_num);
                                m.insert(newvar.clone(), (Type::Float, None));
                                inst_vec.push(VMachine::Let(
                                    newvar.clone(),
                                    VMExp::FLeq(a, b),
                                    cls.1.clone(),
                                )); // batting !
                                inst_vec.push(VMachine::Bnez(newvar, thenl.clone()));
                            }
                            _ => panic!(),
                        };
                        self.virtual_assemble(inst_vec, m, *y, parent.clone());
                        inst_vec.push(VMachine::Jmp(finall.clone()));
                        inst_vec.push(VMachine::Label(thenl));
                        self.virtual_assemble(inst_vec, m, *x, parent.clone());
                        inst_vec.push(VMachine::Label(finall));
                    }
                    _ => panic!(),
                }
                None
            }
            ClosureInner::AppDir(fname, args) => Some(VMExp::AppDir(fname, args)),
            ClosureInner::Var(v) => {
                if let Some(var) = &parent {
                    if *var == v { None } else { Some(VMExp::Var(v)) }
                } else {
                    Some(VMExp::Var(v))
                }
            }
            ClosureInner::Tuple(v) => Some(VMExp::Tuple(v)),
            ClosureInner::Get(arr, idx) => {
                if let Some(i) = is_imm(m, &idx) {
                    Some(VMExp::Get(arr, IdImm::Int(i)))
                } else {
                    Some(VMExp::Get(arr, IdImm::Id(idx)))
                }
            }
            ClosureInner::Put(arr, idx, value) => {
                let oft = if let Some(i) = is_imm(m, &idx) {
                    IdImm::Int(i)
                } else {
                    IdImm::Id(idx)
                };
                inst_vec.push(VMachine::Put(arr, oft, value));
                Some(VMExp::Unit)
            }
            ClosureInner::MakeCls((v, t), cldef, body) => {
                m.insert(v.clone(), (t, None));
                self.closure_func.insert(v.to_string());
                inst_vec.push(VMachine::Let(v, VMExp::MakeCls(cldef), cls.1.clone()));
                self.virtual_assemble(inst_vec, m, *body, parent.clone());
                None
            }
            ClosureInner::AppCls(cl, args) => Some(VMExp::AppCls(cl, args)),
            ClosureInner::ExtArray(_) => unimplemented!(),
        };
        match exp {
            None => (),
            Some(exp) => {
                let var = if let Some(var) = &parent {
                    var
                } else {
                    if let VMExp::Var(v) = &exp { v } else { "res" }
                };
                let retcode = VMachine::RetVal(var.to_string());
                match &exp {
                    VMExp::Int(i) => {
                        m.insert(var.to_string(), (Type::Int, Some(*i)));
                    }
                    VMExp::Add(_, _)
                    | VMExp::Sub(_, _)
                    | VMExp::FEql(_, _)
                    | VMExp::FLeq(_, _)
                    | VMExp::Neg(_)
                    | VMExp::Shl(_, _)
                    | VMExp::Shr(_, _) => {
                        m.insert(var.to_string(), (Type::Int, None));
                    }
                    VMExp::Float(_)
                    | VMExp::FAdd(_, _)
                    | VMExp::FSub(_, _)
                    | VMExp::FMul(_, _)
                    | VMExp::FDiv(_, _)
                    | VMExp::FNeg(_) => {
                        m.insert(var.to_string(), (Type::Float, None));
                    }
                    VMExp::Var(v) => {
                        if let Some(t) = m.get(v) {
                            m.insert(v.clone(), t.clone());
                        }
                    }
                    VMExp::Tuple(vs) => {
                        let tl: Vec<Type> = vs
                        .iter()
                        .map(|v| {
                            if let Some((t, _)) = m.get(v) {
                                t.clone()
                            } else {
                                    panic!("Not found: {v}")
                                }
                            })
                            .collect();
                        m.insert(var.to_string(), (Type::Tuple(tl), None));
                    }
                    VMExp::AppDir(f, _) | VMExp::AppCls(f, _) => {
                        let retty = if let Some(Type::Func(_, ty)) = self.fntype.get(f) {
                            ty.as_ref()
                        } else if let Some((Type::Func(_, ty), _)) = m.get(f) {
                            ty.as_ref()
                        } else {
                            eprintln!("not found: {f}");
                            panic!()
                        };
                        m.insert(var.to_string(), (retty.clone(), None));
                    }
                    VMExp::Get(arr, _) => {
                        if let Some((Type::Array(ty), _)) = m.get(arr) {
                            m.insert(var.to_string(), ((**ty).clone(), None));
                        }
                    }
                    VMExp::Unit => {
                        m.insert(var.to_string(), (Type::Unit, None));
                    }
                    _ => (),
                };
                if let VMExp::Var(v) = &exp {
                    if v != var {
                        inst_vec.push(VMachine::Let(var.to_string(), exp, cls.1));
                    }
                } else {
                    inst_vec.push(VMachine::Let(var.to_string(), exp, cls.1));
                }
                if let None = parent {
                    inst_vec.push(retcode);
                }
            }
        }
    }
    
    fn new_branch(&mut self) -> usize {
        let res = self.branch_counter;
        self.branch_counter += 1;
        res
    }
}

impl Display for VMProg {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        for func in &self.topfn {
            writeln!(f, "[{}] {:?} {:?}", func.name.0, func.args, func.freevar)?;
            for code in &func.body {
                writeln!(f, "{}", code)?;
            }
        }

        Ok(())
    }
}

impl Display for VMachine {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{:?}", self)
    }
}

#[allow(dead_code)]
struct FunDef {
    name: String,
    t: Type,
}
