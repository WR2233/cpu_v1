use std::fmt::Display;

use crate::SymbolPos;
// use crate::Type;
use crate::Var;

pub type Closure = (ClosureInner, SymbolPos);

#[derive(Debug, Clone)]
pub enum ClosureInner {
    Unit,
    Int(i32),
    Float(f32),
    Neg(String),
    Add(String, String),
    Sub(String, String),
    Shl(String, i32),
    Shr(String, i32),
    FNeg(String),
    FAdd(String, String),
    FSub(String, String),
    FMul(String, String),
    FDiv(String, String),
    IfEq(String, String, Box<Closure>, Box<Closure>),
    IfLe(String, String, Box<Closure>, Box<Closure>),
    Let(Var, Box<Closure>, Box<Closure>),
    Var(String),
    MakeCls(Var, ClsDef, Box<Closure>),
    AppCls(String, Vec<String>),
    AppDir(String, Vec<String>),
    Tuple(Vec<String>),
    LetTuple(Vec<Var>, String, Box<Closure>),
    Get(String, String),
    Put(String, String, String),
    ExtArray(String),
}

impl ClosureInner {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>, depth: usize) -> std::fmt::Result {
        match self {
            ClosureInner::Unit => writeln!(f, "{1:0$}Unit", depth * 2, "")?,
            ClosureInner::Int(i) => writeln!(f, "{1:0$}Int {2}", depth * 2, "", i)?,
            ClosureInner::Float(fl) => writeln!(f, "{1:0$}Float {2}", depth * 2, "", fl)?,
            ClosureInner::Neg(v) => writeln!(f, "{1:0$}Neg {2}", depth * 2, "", v)?,
            ClosureInner::Add(a, b) => writeln!(f, "{1:0$}Add {2} {3}", depth * 2, "", a, b)?,
            ClosureInner::Sub(a, b) => writeln!(f, "{1:0$}Sub {2} {3}", depth * 2, "", a, b)?,
            ClosureInner::Shl(a, b) => writeln!(f, "{1:0$}Shl {2} {3}", depth * 2, "", a, b)?,
            ClosureInner::Shr(a, b) => writeln!(f, "{1:0$}Shr {2} {3}", depth * 2, "", a, b)?,
            ClosureInner::FNeg(v) => writeln!(f, "{1:0$}FNeg {2}", depth * 2, "", v)?,
            ClosureInner::FAdd(a, b) => writeln!(f, "{1:0$}FAdd {2} {3}", depth * 2, "", a, b)?,
            ClosureInner::FSub(a, b) => writeln!(f, "{1:0$}FSub {2} {3}", depth * 2, "", a, b)?,
            ClosureInner::FMul(a, b) => writeln!(f, "{1:0$}FMul {2} {3}", depth * 2, "", a, b)?,
            ClosureInner::FDiv(a, b) => writeln!(f, "{1:0$}FDiv {2} {3}", depth * 2, "", a, b)?,
            ClosureInner::IfEq(a, b, e1, e2) => {
                writeln!(f, "{1:0$}If {2} == {3}", depth * 2, "", a, b)?;
                e1.0.fmt(f, depth + 1)?;
                writeln!(f, "{1:0$}Else", depth * 2, "")?;
                e2.0.fmt(f, depth + 1)?;
            }
            ClosureInner::IfLe(a, b, e1, e2) => {
                writeln!(f, "{1:0$}If {2} <= {3}", depth * 2, "", a, b)?;
                e1.0.fmt(f, depth + 1)?;
                writeln!(f, "{1:0$}Else", depth * 2, "")?;
                e2.0.fmt(f, depth + 1)?;
            }
            ClosureInner::Let(v, e1, e2) => {
                writeln!(f, "{1:0$}Let {2:?}", depth * 2, "", v)?;
                e1.0.fmt(f, depth + 1)?;
                writeln!(f, "{1:0$}IN", depth * 2, "")?;
                e2.0.fmt(f, depth + 1)?;
            }
            ClosureInner::AppDir(fun, args) => writeln!(f, "{1:0$}AppDir {2:?} {3:?}", depth * 2, "", fun, args)?,
            ClosureInner::AppCls(fun, args) => writeln!(f, "{1:0$}AppCls {2:?} {3:?}", depth * 2, "", fun, args)?,
            ClosureInner::MakeCls(v, cls, e) => {
                writeln!(f, "{1:0$}MakeCls {2:?} {3:?}", depth * 2, "", v, cls.freevar)?;
                e.0.fmt(f, depth)?;
            }
            ClosureInner::Var(v) => writeln!(f, "{1:0$}Var {2}", depth * 2, "", v)?,
            ClosureInner::Tuple(l) => writeln!(f, "{1:0$}Tuple {2:?}", depth * 2, "", l)?,
            ClosureInner::LetTuple(l, v, e) => {
                writeln!(f, "{1:0$}LetTuple {2:?} = {3} IN", depth * 2, "", l, v)?;
                e.0.fmt(f, depth + 1)?;
            }
            ClosureInner::Get(a, b) => writeln!(f, "{1:0$}Get {2} {3}", depth * 2, "", a, b)?,
            ClosureInner::Put(a, b, c) => writeln!(f, "{1:0$}Put {2} {3} {4}", depth * 2, "", a, b, c)?,
            ClosureInner::ExtArray(v) => writeln!(f, "{1:0$}ExtArray {2}", depth * 2, "", v)?,
        }
        Ok(())
    }
}

impl Display for ClosureInner {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        self.fmt(f, 0)
    }
}

#[derive(Debug, Clone)]
pub struct ClsDef {
    pub label: String,
    pub freevar: Vec<String>,
}

#[derive(Debug)]
pub struct FnDef {
    pub name: Var,
    pub args: Vec<Var>,
    pub freevar: Vec<Var>,
    pub body: Closure,
}

#[derive(Debug)]
pub struct Prog {
    pub topfn: Vec<FnDef>,
    pub body: Closure,
}

impl Display for Prog {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        for fun in &self.topfn {
            writeln!(f, "[{:?}] {:?} {:?}", fun.name, fun.args, fun.freevar)?;
            fun.body.0.fmt(f, 1)?;
        }
        writeln!(f, "[MAIN]")?;
        self.body.0.fmt(f, 1)?;
        Ok(())
    }
}
