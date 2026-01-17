pub mod closure;
pub mod del_array;
pub mod parser;
pub mod vmachine;
pub mod emit;
pub mod asm;
pub mod register_alloc;
pub mod emit_asm;

#[allow(dead_code)]
#[derive(Debug, Default, Clone)]
pub struct Position {
    pos_fname: String,
    pos_lnum: usize,
    pos_bol: usize,
    pos_cnum: usize,
}

#[derive(Debug, Clone)]
pub enum Type {
    Unit,
    Int,
    Float,
    Func(Vec<Type>, Box<Type>),
    Tuple(Vec<Type>),
    Array(Box<Type>),
}
pub type Var = (String, Type);

pub type SymbolPos = (Position, Position);
