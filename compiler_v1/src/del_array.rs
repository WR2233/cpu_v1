use crate::SymbolPos;
use crate::Type;
use crate::closure::Closure;
use crate::closure::ClosureInner;
use crate::closure::Prog;

use std::collections::BTreeSet;
use std::collections::HashMap;

fn check_array_rec(
    cls: &mut Closure,
    arrmap: &mut HashMap<String, (HashMap<String, String>, Option<String>)>,
    cand: &mut BTreeSet<String>,
    const_int: &mut HashMap<String, i32>,
    is_main: bool,
) {
    let (inner, _) = cls;
    if is_main {
        match &inner {
            ClosureInner::Var(var) => {
                cand.remove(var);
            }
            ClosureInner::Tuple(vars) => {
                for var in vars {
                    cand.remove(var);
                }
            }
            _ => (),
        }
    }
    match inner {
        ClosureInner::Let((var, _), exp, last) => {
            match &exp.0 {
                ClosureInner::AppDir(fun, args) => {
                    if fun == "min_caml_create_array" || fun == "min_caml_create_float_array" {
                        // let size = &args[0];
                        let init = args[1].clone();
                        arrmap.insert(var.clone(), (HashMap::new(), Some(init)));
                        cand.insert(var.clone());
                    }
                }
                // for construct const int map
                ClosureInner::Int(i) => {
                    const_int.insert(var.clone(), *i);
                }
                ClosureInner::Var(v) => {
                    if let Some(i) = const_int.get(v) {
                        const_int.insert(var.clone(), *i);
                    }
                }
                _ => (),
            }
            check_array_rec(exp, arrmap, cand, const_int, false);
            check_array_rec(last, arrmap, cand, const_int, true);
        }
        ClosureInner::LetTuple(_, _, last) => {
            check_array_rec(last, arrmap, cand, const_int, true);
        }
        ClosureInner::Get(arr, idx) => {
            if let Some((a, init)) = arrmap.get(arr) {
                let idx = if let Some(i) = const_int.get(idx) {
                    &format!("I({i})")
                } else {
                    idx as &str
                };
                if let Some(fact) = a.get(idx) {
                    *inner = ClosureInner::Var(fact.clone());
                    return;
                } else if let Some(init) = init {
                    *inner = ClosureInner::Var(init.clone());
                    return;
                }
            }
            cand.remove(arr);
        }
        ClosureInner::Put(arr, idx, val) => {
            if let Some((a, init)) = arrmap.get_mut(arr) {
                if let Some(i) = const_int.get(idx) {
                    // 定数インデックスの値を変更した場合は、場所が決まる
                    a.insert(format!("I({i})"), val.clone());
                } else {
                    // インデックスが実行時に決まる場合
                    a.insert(idx.clone(), val.clone());
                    *init = None;
                }
            }
            // 配列が別の配列に格納された場合には、削除候補から除外
            // 格納先配列(arr)が削除される場合には、この配列(val)も消さないとねぇ...
            cand.remove(val);
        }
        ClosureInner::IfEq(_, _, e1, e2) | ClosureInner::IfLe(_, _, e1, e2) => {
            // 分岐の中は新しい環境を用意
            let mut arrmap4e1 = arrmap.clone();
            let mut arrmap4e2 = arrmap.clone();
            check_array_rec(e1, &mut arrmap4e1, cand, const_int, true);
            check_array_rec(e2, &mut arrmap4e2, cand, const_int, true);
            // the content of array may be changed!!!
            for (arr, (map, init)) in arrmap {
                if let (Some(map1), Some(map2)) = (arrmap4e1.get(arr), arrmap4e2.get(arr)) {
                    // eprintln!("{:?}", map1);
                    // eprintln!("{:?}", map2);
                    if map1 == map2 {
                        (*map, *init) = map1.clone();
                    } else {
                        // stop deleting `arr`
                        cand.remove(arr);
                        map.clear();
                        *init = None;
                    }
                }
            }
        }
        ClosureInner::AppDir(_, args) | ClosureInner::AppCls(_, args) => {
            for arg in args {
                if let Some((map, init)) = arrmap.get_mut(arg) {
                    map.clear();
                    *init = None;
                    cand.remove(arg);
                }
            }
        }
        ClosureInner::MakeCls(_, clsdef, last) => {
            // クロージャの自由変数に含まれていたら削除しない
            for fvar in &clsdef.freevar {
                if let Some((map, init)) = arrmap.get_mut(fvar) {
                    map.clear();
                    *init = None;
                    cand.remove(fvar);
                }
            }
            check_array_rec(last, arrmap, cand, const_int, true);
        }
        ClosureInner::Tuple(vl) => {
            for v in vl {
                cand.remove(v);
            }
        }
        _ => (),
    }
}

fn delete_from_closure(cls: Closure, del_array: &BTreeSet<String>) -> Closure {
    let (inner, pos) = cls;
    match inner {
        ClosureInner::Let((var, ty), exp, last) => {
            if del_array.contains(&var) {
                delete_from_closure(*last, del_array)
            } else {
                let nexp = delete_from_closure(*exp, del_array);
                let nlast = delete_from_closure(*last, del_array);
                (
                    ClosureInner::Let((var, ty), Box::new(nexp), Box::new(nlast)),
                    pos,
                )
            }
        }
        ClosureInner::Put(var, idx, val) => {
            if del_array.contains(&var) {
                (ClosureInner::Unit, pos)
            } else {
                (ClosureInner::Put(var, idx, val), pos)
            }
        }
        ClosureInner::LetTuple(vars, tup, last) => {
            let nlast = delete_from_closure(*last, del_array);
            (ClosureInner::LetTuple(vars, tup, Box::new(nlast)), pos)
        }
        ClosureInner::IfEq(a, b, e1, e2) => {
            let ne1 = delete_from_closure(*e1, del_array);
            let ne2 = delete_from_closure(*e2, del_array);
            (ClosureInner::IfEq(a, b, Box::new(ne1), Box::new(ne2)), pos)
        }
        ClosureInner::IfLe(a, b, e1, e2) => {
            let ne1 = delete_from_closure(*e1, del_array);
            let ne2 = delete_from_closure(*e2, del_array);
            (ClosureInner::IfLe(a, b, Box::new(ne1), Box::new(ne2)), pos)
        }
        ClosureInner::MakeCls(var, clsdef, last) => {
            let nlast = delete_from_closure(*last, del_array);
            (ClosureInner::MakeCls(var, clsdef, Box::new(nlast)), pos)
        }
        _ => (inner, pos),
    }
}

pub fn delete_unnecessary_array(prog: &mut Prog) {
    for fun in prog.topfn.iter_mut() {
        let mut arrmap = HashMap::new();
        for (v, t) in &fun.args {
            if let Type::Array(_) = t {
                arrmap.insert(v.clone(), (HashMap::new(), None));
            }
        }
        let mut cand = BTreeSet::new();
        let mut const_int = HashMap::new();
        check_array_rec(&mut fun.body, &mut arrmap, &mut cand, &mut const_int, true);
        let mut buf = (ClosureInner::Unit, SymbolPos::default());
        std::mem::swap(&mut fun.body, &mut buf);
        eprintln!("removing arrays {:?} from {}", cand, fun.name.0);
        fun.body = delete_from_closure(buf, &cand);
    }
    let mut arrmap = HashMap::new();
    let mut cand = BTreeSet::new();
    let mut const_int = HashMap::new();
    check_array_rec(&mut prog.body, &mut arrmap, &mut cand, &mut const_int, true);
    let mut buf = (ClosureInner::Unit, SymbolPos::default());
    std::mem::swap(&mut prog.body, &mut buf);
    eprintln!("removing arrays {:?} from main", cand);
    prog.body = delete_from_closure(buf, &cand);
}
