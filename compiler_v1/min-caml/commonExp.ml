open KNormal

let compare_t t1 t2 = match (t1, t2) with
  | (Unit, Unit) -> 0
  | (Int(a,_), Int(b,_)) -> compare a b
  | (Float(a,_), Float(b,_)) -> compare a b
  | (Neg(a,_), Neg(b,_)) | (FNeg(a,_), FNeg(b,_)) -> compare a b
  | (Add(a1,a2,_), Add(b1,b2,_)) | (Sub(a1,a2,_), Sub(b1,b2,_))
  | (FAdd(a1,a2,_), FAdd(b1,b2,_)) | (FSub(a1,a2,_), FSub(b1,b2,_))
  | (FMul(a1,a2,_), FMul(b1,b2,_)) | (FDiv(a1,a2,_), FDiv(b1,b2,_)) ->
    (match compare a1 b1 with
      | 0 -> compare a2 b2
      | c -> c
    )
  | (Shl(a1,a2,_), Shl(b1,b2,_)) | (Shr(a1,a2,_), Shr(b1,b2,_)) ->
    (match compare a1 b1 with
      | 0 -> compare a2 b2
      | c -> c
    )
  | (Unit,_) | (Int(_),_) | (Float(_),_) | (Neg(_),_) | (Add(_),_) | (Sub(_),_) | (Shl(_),_) | (Shr(_),_) | (FNeg(_),_) | (FAdd(_),_) | (FSub(_),_) | (FMul(_),_) | (FDiv(_),_) | (Var(_),_) -> 1
  | _ -> -1

module TComp =
  struct
    type t = KNormal.t
    let compare = compare_t
end

module TM = Map.Make(TComp)

let rec g env = function
  | LetRec({ name = (x, t); args = yts; body = e1 }, e2, p) ->
    let e1' = g TM.empty e1 in
    let e2' = g env e2 in
    LetRec({ name = (x, t); args = yts; body = e1' }, e2', p)
  | Let((x, t), e1, e2, p) ->
    let e1' = g env e1 in
    let env' = TM.add e1' x env in
    let e2' = g env' e2 in
    Let((x, t), e1', e2', p)
  | Unit | Int(_) | Float(_) as e -> e
  | Neg(_) | Add(_) | Sub(_) | Shl(_) | Shr(_) | FNeg(_) | FAdd(_) | FSub(_) | FMul(_) | FDiv(_) as e ->
    let p = get_pos e in
    let (st, en) = p in
    (match TM.find_opt e env with
    | Some(vname) -> Printf.eprintf "common subexpression eliminating: line %d-%d\n" st.pos_lnum en.pos_lnum;Var(vname, p)
    | None -> e)
  | _ as exp -> exp


let f t = g TM.empty t
