use crate::Var;
use std::{collections::HashSet, fmt::Display};

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
#[repr(usize)]
#[allow(non_camel_case_types)]
pub enum Reg {
    t0,
    t1,
    t2,
    t3,
    t4,
    t5,
    t6,
    a0,
    a1,
    a2,
    a3,
    a4,
    a5,
    a6,
    a7,
    s0,
    s1,
    s2,
    s3,
    s4,
    s5,
    s6,
    s7,
    s8,
    s9,
    s10,
    s11,
    zero,
    ra,
    sp,
    gp,
    tp,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
#[repr(usize)]
#[allow(non_camel_case_types)]
pub enum FReg {
    ft0,
    ft1,
    ft2,
    ft3,
    ft4,
    ft5,
    ft6,
    ft7,
    fa0,
    fa1,
    fa2,
    fa3,
    fa4,
    fa5,
    fa6,
    fa7,
    ft8,
    ft9,
    ft10,
    ft11,
    fs0,
    fs1,
    fs2,
    fs3,
    fs4,
    fs5,
    fs6,
    fs7,
    fs8,
    fs9,
    fs10,
    fs11,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum IorF {
    I,
    F,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum ValueBox {
    Reg(Reg),
    FReg(FReg),
    Mem(i32, IorF),
    Cls(i32, IorF),
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Regs {
    Reg(Reg),
    FReg(FReg),
}

#[derive(Debug)]
pub enum Asm {
    Li(Reg, i32),
    FLi(FReg, f32),
    Mv(ValueBox, ValueBox),
    UniOp(UniOpKind, Regs, Regs),
    BinOp(BinOpKind, Regs, Regs, Regs),
    BinOpImm(BinOpKind, Regs, Regs, i32),
    Call(String),
    CallCls,
    MakeCls(Reg, String, Vec<Option<ValueBox>>),
    Ret(Option<ValueBox>),
    Branch(CmpKind, Reg, Reg, String),
    Label(String),
    Put(Reg, Reg, Regs),
    PutImm(Reg, i32, Regs),
    Raw(String),
}

#[derive(Debug, Clone, Copy)]
pub enum UniOpKind {
    Neg,
    FNeg,
}

#[derive(Debug, Clone, Copy)]
pub enum BinOpKind {
    Add,
    Sub,
    Shl,
    Shr,
    FAdd,
    FSub,
    FMul,
    FDiv,
    FEql,
    FLeq,
    Get,
}

#[derive(Debug, Clone, Copy)]
pub enum CmpKind {
    Eq,
    Ne,
    Ge,
}

#[derive(Debug)]
pub struct AsmFn {
    pub body: Vec<Asm>,
    pub name: Var,
    pub args: Vec<(Var, ValueBox)>,
    pub freevar: Vec<Var>,
    pub spill_count: usize,
}

pub struct AsmProg {
    pub topfn: Vec<AsmFn>,
    pub closure_func: HashSet<String>,
}

pub const LOCAL_REG: [Reg; 22]= [
    Reg::t0,
    Reg::t1,
    Reg::t2,
    Reg::t3,
    Reg::t4,
    Reg::t5,
    Reg::t6,
    Reg::a0,
    Reg::a1,
    Reg::a2,
    Reg::a3,
    Reg::a4,
    Reg::a5,
    Reg::a6,
    Reg::a7,
    Reg::s2,
    Reg::s3,
    Reg::s4,
    Reg::s5,
    Reg::s6,
    Reg::s7,
    Reg::s8,
    // Reg::s9, // for closure
    // Reg::s10,
    // Reg::s11, // for input data rom
];

pub const LOCAL_FREG: [FReg; 31] = [
    FReg::ft0,
    FReg::ft1,
    FReg::ft2,
    FReg::ft3,
    FReg::ft4,
    FReg::ft5,
    FReg::ft6,
    FReg::ft7,
    FReg::ft8,
    FReg::ft9,
    FReg::ft10,
    FReg::ft11,
    FReg::fa0,
    FReg::fa1,
    FReg::fa2,
    FReg::fa3,
    FReg::fa4,
    FReg::fa5,
    FReg::fa6,
    FReg::fa7,
    FReg::fs0,
    FReg::fs1,
    FReg::fs2,
    FReg::fs3,
    FReg::fs4,
    FReg::fs5,
    FReg::fs6,
    FReg::fs7,
    FReg::fs8,
    FReg::fs9,
    FReg::fs10,
    // FReg::fs11,
];

pub const ARG_REG: [Reg; 15] = [
    Reg::a0,
    Reg::a1,
    Reg::a2,
    Reg::a3,
    Reg::a4,
    Reg::a5,
    Reg::a6,
    Reg::a7,
    Reg::t0,
    Reg::t1,
    Reg::t2,
    Reg::t3,
    Reg::t4,
    Reg::t5,
    Reg::t6,
];

pub const ARG_FREG: [FReg; 20] = [
    FReg::fa0,
    FReg::fa1,
    FReg::fa2,
    FReg::fa3,
    FReg::fa4,
    FReg::fa5,
    FReg::fa6,
    FReg::fa7,
    FReg::ft0,
    FReg::ft1,
    FReg::ft2,
    FReg::ft3,
    FReg::ft4,
    FReg::ft5,
    FReg::ft6,
    FReg::ft7,
    FReg::ft8,
    FReg::ft9,
    FReg::ft10,
    FReg::ft11,
];

impl Display for Reg {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{:?}", self)
    }
}

impl Display for FReg {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{:?}", self)
    }
}

impl Display for Regs {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Regs::Reg(r) => write!(f, "{:?}", r),
            Regs::FReg(r) => write!(f, "{:?}", r),
        }
    }
}

impl Display for ValueBox {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            ValueBox::Reg(r) => write!(f, "{:?}", r),
            ValueBox::FReg(r) => write!(f, "{:?}", r),
            ValueBox::Mem(idx, iorf) => {
                write!(f, "mem({:?}, {:?})", idx, iorf)
            }
            ValueBox::Cls(idx, iorf) => {
                write!(f, "cls({:?}, {:?})", idx, iorf)
            }
        }
    }
}

impl Display for AsmProg {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        self.topfn.iter().try_for_each(|func| {
            writeln!(f, "[{:?}] {:?} {:?}", func.name.0, func.args, func.freevar).and(
                func.body.iter().try_for_each(|asm| writeln!(f, "{:?}", asm))
            )
        })
    }
}