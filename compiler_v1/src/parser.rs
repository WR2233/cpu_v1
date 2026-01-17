use std::usize;

use crate::Position;
use crate::SymbolPos;
use crate::Type;
use crate::closure::Closure;
use crate::closure::ClosureInner;
use crate::closure::ClsDef;
use crate::closure::FnDef;
use crate::closure::Prog;
use crate::Var;

use nom::Parser;
use nom::branch::permutation;
use nom::bytes::complete::is_not;
use nom::character::complete::anychar;
use nom::{
    IResult,
    character::complete::{alpha1, char, i32, multispace0, one_of, usize, isize},
    combinator::opt,
    multi::many1,
    number::complete::float,
    sequence::delimited,
};

fn parse_string(input: &str) -> IResult<&str, String> {
    let (s, cont) = delimited(char('"'), opt(is_not("\"")), char('"')).parse(input)?;
    match cont {
        Some(cont) => Ok((s, cont.to_string())),
        None => Ok((s, String::new())),
    }
}

fn parse_ident(input: &str) -> IResult<&str, String> {
    let (s, id) = many1(one_of(
        "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz._'",
    ))
    .parse(input)?;
    let mut res = String::new();
    id.iter().for_each(|c| res.push(*c));
    Ok((s, res))
}

fn read_comma(input: &str) -> IResult<&str, ()> {
    let (input, _) = delimited(multispace0, char(','), multispace0).parse(input)?;
    Ok((input, ()))
}

fn parse_pos(input: &str) -> IResult<&str, Position> {
    let (s, (fname, lnum, bol, cnum)) = parse_quadto(
        input,
        parse_string,
        |i| usize(i),
        |i| usize(i),
        |i| isize(i),
    )?;

    let res = Position {
        pos_fname: fname,
        pos_lnum: lnum,
        pos_bol: bol,
        pos_cnum: if cnum < 0 {usize::default()} else {cnum as usize},
    };

    Ok((s, res))
}

pub fn parse_sympos(input: &str) -> IResult<&str, SymbolPos> {
    let (s, (p1, p2)) = parse_bito(input, parse_pos, parse_pos)?;
    Ok((s, (p1, p2)))
}

#[allow(dead_code)]
fn parse_mono<'a, T, F>(input: &'a str, mut f: F) -> IResult<&'a str, T>
where
    F: FnMut(&'a str) -> IResult<&'a str, T>,
{
    let (s, (_, t, _)) = permutation((char('('), |i| f(i), char(')'))).parse(input)?;
    Ok((s, t))
}

fn parse_bito<'a, T1, T2, F1, F2>(
    input: &'a str,
    mut f1: F1,
    mut f2: F2,
) -> IResult<&'a str, (T1, T2)>
where
    F1: FnMut(&'a str) -> IResult<&'a str, T1>,
    F2: FnMut(&'a str) -> IResult<&'a str, T2>,
{
    let (s, (_, t1, _, t2, _)) =
        permutation((char('('), |i| f1(i), read_comma, |i| f2(i), char(')'))).parse(input)?;
    Ok((s, (t1, t2)))
}

fn parse_trito<T1, T2, T3, F1, F2, F3>(
    input: &str,
    mut f1: F1,
    mut f2: F2,
    mut f3: F3,
) -> IResult<&str, (T1, T2, T3)>
where
    F1: FnMut(&str) -> IResult<&str, T1>,
    F2: FnMut(&str) -> IResult<&str, T2>,
    F3: FnMut(&str) -> IResult<&str, T3>,
{
    let (s, (_, t1, _, t2, _, t3, _)) = permutation((
        char('('),
        |i| f1(i),
        read_comma,
        |i| f2(i),
        read_comma,
        |i| f3(i),
        char(')'),
    ))
    .parse(input)?;
    Ok((s, (t1, t2, t3)))
}

fn parse_quadto<T1, T2, T3, T4, F1, F2, F3, F4>(
    input: &str,
    mut f1: F1,
    mut f2: F2,
    mut f3: F3,
    mut f4: F4,
) -> IResult<&str, (T1, T2, T3, T4)>
where
    F1: FnMut(&str) -> IResult<&str, T1>,
    F2: FnMut(&str) -> IResult<&str, T2>,
    F3: FnMut(&str) -> IResult<&str, T3>,
    F4: FnMut(&str) -> IResult<&str, T4>,
{
    let (s, (_, t1, _, t2, _, t3, _, t4, _)) = permutation((
        char('('),
        |i| f1(i),
        read_comma,
        |i| f2(i),
        read_comma,
        |i| f3(i),
        read_comma,
        |i| f4(i),
        char(')'),
    ))
    .parse(input)?;
    Ok((s, (t1, t2, t3, t4)))
}

fn parse_pentato<T1, T2, T3, T4, T5, F1, F2, F3, F4, F5>(
    input: &str,
    mut f1: F1,
    mut f2: F2,
    mut f3: F3,
    mut f4: F4,
    mut f5: F5,
) -> IResult<&str, (T1, T2, T3, T4, T5)>
where
    F1: FnMut(&str) -> IResult<&str, T1>,
    F2: FnMut(&str) -> IResult<&str, T2>,
    F3: FnMut(&str) -> IResult<&str, T3>,
    F4: FnMut(&str) -> IResult<&str, T4>,
    F5: FnMut(&str) -> IResult<&str, T5>,
{
    let (s, (_, t1, _, t2, _, t3, _, t4, _, t5, _)) = permutation((
        char('('),
        |i| f1(i),
        read_comma,
        |i| f2(i),
        read_comma,
        |i| f3(i),
        read_comma,
        |i| f4(i),
        read_comma,
        |i| f5(i),
        char(')'),
    ))
    .parse(input)?;
    Ok((s, (t1, t2, t3, t4, t5)))
}

fn parse_seq<'a, T, F>(input: &'a str, mut f: F) -> IResult<&'a str, Vec<T>>
where
    F: FnMut(&'a str) -> IResult<&'a str, T>,
{
    let mut res = Vec::new();
    let (mut s, _) = char('[')(input)?;
    while s.as_bytes()[0] != ']' as u8 {
        let (tmp, p) = f(s)?;
        res.push(p);
        let (tmp, _) = opt(read_comma).parse(tmp)?;
        s = tmp;
    }
    let (s, _) = char(']')(s)?;
    Ok((s, res))
}

fn parse_var(input: &str) -> IResult<&str, Var> {
    let (s, (_, v, _, ty, _)) = permutation((
        char('('),
        parse_ident,
        read_comma,
        parse_type,
        char(')'),
    ))
    .parse(input)?;
    Ok((s, (v, ty)))
}

fn parse_type(input: &str) -> IResult<&str, Type> {
    // let (s, t) = one_of("UIFCTA")(input)?;
    let (s, t) = anychar(input)?;
    let res = match t {
        'U' => (s, Type::Unit),
        'I' | 'B' => (s, Type::Int),
        'F' => (s, Type::Float),
        'C' => {
            let (s, (args, t)) = parse_bito(
                s,
                |i| parse_seq(i, parse_type),
                parse_type,
            )?;
            (s, Type::Func(args, Box::new(t)))
        }
        'T' => {
            let (s, args) = parse_mono(
                s,
                |i| parse_seq(i, parse_type),
            )?;
            (s, Type::Tuple(args))
        }
        'A' => {
            let (s, t) = parse_mono(
                s,
                parse_type,
            )?;
            (s, Type::Array(Box::new(t)))
        }
        _ => panic!(),
    };
    Ok(res)
}

pub fn parse_closure(input: &str) -> IResult<&str, Closure> {
    let (s, kind) = alpha1(input)?;
    // eprintln!("{}", kind);
    let res = match kind {
        "Unit" => (s, (ClosureInner::Unit, SymbolPos::default())),
        "Int" => {
            let (s, (i, p)) = parse_bito(s, i32, parse_sympos)?;
            (s, (ClosureInner::Int(i), p))
        }
        "Float" => {
            let (s, (f, p)) = parse_bito(s, float, parse_sympos)?;
            (s, (ClosureInner::Float(f), p))
        }
        "Neg" | "FNeg" | "Var" => {
            let (s, (v, p)) = parse_bito(s, parse_ident, parse_sympos)?;
            match kind {
                "Neg" => (s, (ClosureInner::Neg(v), p)),
                "FNeg" => (s, (ClosureInner::FNeg(v), p)),
                "Var" => (s, (ClosureInner::Var(v), p)),
                _ => unreachable!(),
            }
        }
        "Add" | "Sub" | "FAdd" | "FSub" | "FMul" | "FDiv" | "Get" => {
            let (s, (a, b, p)) = parse_trito(s, parse_ident, parse_ident, parse_sympos)?;
            match kind {
                "Add" => (s, (ClosureInner::Add(a, b), p)),
                "Sub" => (s, (ClosureInner::Sub(a, b), p)),
                "FAdd" => (s, (ClosureInner::FAdd(a, b), p)),
                "FSub" => (s, (ClosureInner::FSub(a, b), p)),
                "FMul" => (s, (ClosureInner::FMul(a, b), p)),
                "FDiv" => (s, (ClosureInner::FDiv(a, b), p)),
                "Get" => (s, (ClosureInner::Get(a, b), p)),
                _ => unreachable!(),
            }
        }
        "Shl" | "Shr" => {
            let (s, (a, b, p)) = parse_trito(s, parse_ident, |s| i32(s), parse_sympos)?;
            match kind {
                "Shl" => (s, (ClosureInner::Shl(a, b), p)),
                "Shr" => (s, (ClosureInner::Shr(a, b), p)),
                _ => unreachable!(),
            }
        }
        "IfEq" | "IfLe" => {
            let (s, (a, b, x, y, p)) = parse_pentato(
                s,
                parse_ident,
                parse_ident,
                parse_closure,
                parse_closure,
                parse_sympos,
            )?;
            match kind {
                "IfEq" => (s, (ClosureInner::IfEq(a, b, Box::new(x), Box::new(y)), p)),
                "IfLe" => (s, (ClosureInner::IfLe(a, b, Box::new(x), Box::new(y)), p)),
                _ => unreachable!(),
            }
        }
        "Let" => {
            let (s, (var, x, y, p)) =
                parse_quadto(s, parse_var, parse_closure, parse_closure, parse_sympos)?;
            (s, (ClosureInner::Let(var, Box::new(x), Box::new(y)), p))
        }
        "LetTuple" => {
            let (s, (vv, t, e, p)) = parse_quadto(
                s,
                |i| parse_seq(i, parse_var),
                parse_ident,
                parse_closure,
                parse_sympos,
            )?;
            (s, (ClosureInner::LetTuple(vv, t, Box::new(e)), p))
        }
        "MakeCls" => {
            let (s, (n, (l, v), e, p)) = parse_quadto(
                s,
                parse_var,
                |i| parse_bito(i, parse_ident, |j| parse_seq(j, parse_ident)),
                parse_closure,
                parse_sympos,
            )?;
            let cls = ClsDef {
                label: l,
                freevar: v,
            };
            (s, (ClosureInner::MakeCls(n, cls, Box::new(e)), p))
        }
        "AppDir" | "AppCls" => {
            let (s, (f, args, p)) =
                parse_trito(s, parse_ident, |i| parse_seq(i, parse_ident), parse_sympos)?;
            match kind {
                "AppDir" => (s, (ClosureInner::AppDir(f, args), p)),
                "AppCls" => (s, (ClosureInner::AppCls(f, args), p)),
                _ => unreachable!(),
            }
        }
        "Tuple" => {
            let (s, (v, p)) = parse_bito(s, |i| parse_seq(i, parse_ident), parse_sympos)?;
            (s, (ClosureInner::Tuple(v), p))
        }
        "Put" => {
            let (s, (arr, idx, val, p)) =
                parse_quadto(s, parse_ident, parse_ident, parse_ident, parse_sympos)?;
            (s, (ClosureInner::Put(arr, idx, val), p))
        }
        "ExtArray" => {
            let (s, (arr, p)) = parse_bito(s, parse_ident, parse_sympos)?;
            (s, (ClosureInner::ExtArray(arr), p))
        }
        _ => panic!("{}", kind),
    };
    Ok(res)
}

fn parse_fndef(input: &str) -> IResult<&str, FnDef> {
    let (s, (name, args, freevar, body)) = parse_quadto(
        input,
        parse_var,
        |i| parse_seq(i, parse_var),
        |i| parse_seq(i, parse_var),
        parse_closure,
    )?;
    let res = FnDef {
        name,
        args,
        freevar,
        body,
    };
    Ok((s, res))
}

pub fn parse_prog(input: &str) -> IResult<&str, Prog> {
    let (s, (topfn, body)) = parse_bito(input, |i| parse_seq(i, parse_fndef), parse_closure)?;
    Ok((s, Prog { topfn, body }))
}

#[cfg(test)]
mod tests {
    use super::*;

    fn parse_vars(input: &str) -> IResult<&str, Vec<String>> {
        parse_seq(input, parse_ident)
    }

    #[test]
    fn parse_vars_test() {
        let ans = vec!["apple".to_string()];
        assert_eq!(ans, parse_vars("[apple]").unwrap().1);
        let ans = vec![
            "apple".to_string(),
            "banana".to_string(),
            "cookie".to_string(),
            "daemon".to_string(),
            "english".to_string(),
        ];
        assert_eq!(
            ans,
            parse_vars("[apple, banana, cookie, daemon, english]")
                .unwrap()
                .1
        );
    }

    #[test]
    fn parse_closure_test() {
        let (_, _) = parse_closure("Int(1, ((\"\", 0, 0, 0), (\"\", 0, 0, 0)))").unwrap();
        // println!("{:?}", res);
        let (_, _) = parse_closure(
            "AppDir(min_caml_print_int, [Ti3.20], ((\"\", 10, 139, 139), (\"\", 10, 139, 158)))",
        )
        .unwrap();
        // println!("{:?}", res);
        let (_, _) = parse_closure("Let((Ti5.18, I), AppDir(f.9, [c.15, a.13, b.14], ((\"\", 12, 181, 192), (\"\", 12, 181, 199))), AppDir(min_caml_print_int, [Ti5.18], ((\"\", 12, 181, 181), (\"\", 12, 181, 200))), ((\"\", 12, 181, 192), (\"\", 12, 181, 199)))").unwrap();
        // println!("{:?}", res);
        let (_, _) = parse_closure("Let((Tu1.17, U), AppDir(min_caml_print_int, [Ti4.19], ((\"\", 11, 160, 160), (\"\", 11, 160, 179))), Let((Ti5.18, I), AppDir(f.9, [c.15, a.13, b.14], ((\"\", 12, 181, 192), (\"\", 12, 181, 199))), AppDir(min_caml_print_int, [Ti5.18], ((\"\", 12, 181, 181), (\"\", 12, 181, 200))), ((\"\", 12, 181, 192), (\"\", 12, 181, 199))), ((\"\", 11, 160, 160), (\"\", 12, 181, 200)))").unwrap();
        // println!("{:?}", res);
        let (_, _) = parse_closure("Let((Tu2.16, U), AppDir(min_caml_print_int, [Ti3.20], ((\"\", 10, 139, 139), (\"\", 10, 139, 158))), Let((Ti4.19, I), AppDir(f.9, [b.14, c.15, a.13], ((\"\", 11, 160, 171), (\"\", 11, 160, 178))), Let((Tu1.17, U), AppDir(min_caml_print_int, [Ti4.19], ((\"\", 11, 160, 160), (\"\", 11, 160, 179))), Let((Ti5.18, I), AppDir(f.9, [c.15, a.13, b.14], ((\"\", 12, 181, 192), (\"\", 12, 181, 199))), AppDir(min_caml_print_int, [Ti5.18], ((\"\", 12, 181, 181), (\"\", 12, 181, 200))), ((\"\", 12, 181, 192), (\"\", 12, 181, 199))), ((\"\", 11, 160, 160), (\"\", 12, 181, 200))), ((\"\", 11, 160, 171), (\"\", 11, 160, 178))), ((\"\", 10, 139, 139), (\"\", 12, 181, 200)))").unwrap();
        // println!("{:?}", res);
        // float
        let (_, _) = parse_closure("Let((Td3.11, F), Float(2.000000, ((\"\", 1, 0, 24), (\"\", 1, 0, 27))), Float(2.000000, ((\"\", 1, 0, 24), (\"\", 1, 0, 27))), ((\"\", 1, 0, 24), (\"\", 1, 0, 27)))").unwrap();
        // println!("{:?}", res);
        // fact.ml
        let (_, _) = parse_closure("Let((Td3.11, F), Float(2.000000, ((\"\", 1, 0, 24), (\"\", 1, 0, 27))), IfLe(Td3.11, n.8, Let((Td4.14, F), Float(1.000000, ((\"\", 1, 0, 58), (\"\", 1, 0, 61))), Let((Td5.13, F), FSub(n.8, Td4.14, ((\"\", 1, 0, 53), (\"\", 1, 0, 61))), Let((Td6.12, F), AppDir(fact.7, [Td5.13], ((\"\", 1, 0, 48), (\"\", 1, 0, 62))), FMul(n.8, Td6.12, ((\"\", 1, 0, 43), (\"\", 1, 0, 62))), ((\"\", 1, 0, 58), (\"\", 1, 0, 61))), ((\"\", 1, 0, 58), (\"\", 1, 0, 61))), ((\"\", 1, 0, 58), (\"\", 1, 0, 61))), Float(1.000000, ((\"\", 1, 0, 33), (\"\", 1, 0, 36))), ((\"\", 1, 0, 20), (\"\", 1, 0, 27))), ((\"\", 1, 0, 24), (\"\", 1, 0, 27)))").unwrap();
        // println!("{:?}", res);
    }

    #[test]
    fn parse_var_test() {
        let (_, _) = parse_var("(Td3.11, F)").unwrap();
        // println!("{:?}", res);
    }

    #[test]
    fn parse_pos_test() {
        let (_, _) = parse_pos("(\"\", 0, 0, -1)").unwrap();
        // println!("{:?}", res);
    }
}
