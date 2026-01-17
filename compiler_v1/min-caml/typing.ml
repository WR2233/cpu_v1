(* type inference/reconstruction *)

open Syntax

exception Unify of Type.t * Type.t
exception Error of t * Type.t * Type.t
exception PartApp of Type.t list * Type.t

let extenv = ref M.empty

(* for pretty printing (and type normalization) *)
let rec deref_typ = function (* 型変数を中身でおきかえる関数 (caml2html: typing_deref) *)
  | Type.Fun(t1s, t2) -> Type.Fun(List.map deref_typ t1s, deref_typ t2)
  | Type.Tuple(ts) -> Type.Tuple(List.map deref_typ ts)
  | Type.Array(t) -> Type.Array(deref_typ t)
  | Type.Var({ contents = None } as r) ->
      Format.eprintf "uninstantiated type variable detected; assuming int@.";
      r := Some(Type.Int);
      Type.Int
  | Type.Var({ contents = Some(t) } as r) ->
      let t' = deref_typ t in
      r := Some(t');
      t'
  | t -> t
let rec deref_id_typ (x, t) = (x, deref_typ t)
let rec deref_term = function
  | Not(e, p) -> Not(deref_term e, p)
  | Neg(e, p) -> Neg(deref_term e, p)
  | Add(e1, e2, p) -> Add(deref_term e1, deref_term e2, p)
  | Sub(e1, e2, p) -> Sub(deref_term e1, deref_term e2, p)
  | Shl(e1, i, p) -> Shl(deref_term e1, i, p)
  | Shr(e1, i, p) -> Shr(deref_term e1, i, p)
  | Eq(e1, e2, p) -> Eq(deref_term e1, deref_term e2, p)
  | LE(e1, e2, p) -> LE(deref_term e1, deref_term e2, p)
  | FNeg(e, p) -> FNeg(deref_term e, p)
  | FAdd(e1, e2, p) -> FAdd(deref_term e1, deref_term e2, p)
  | FSub(e1, e2, p) -> FSub(deref_term e1, deref_term e2, p)
  | FMul(e1, e2, p) -> FMul(deref_term e1, deref_term e2, p)
  | FDiv(e1, e2, p) -> FDiv(deref_term e1, deref_term e2, p)
  | If(e1, e2, e3, p) -> If(deref_term e1, deref_term e2, deref_term e3, p)
  | Let(xt, e1, e2, p) -> Let(deref_id_typ xt, deref_term e1, deref_term e2, p)
  | LetRec({ name = xt; args = yts; body = e1 }, e2, p) ->
      LetRec({ name = deref_id_typ xt;
               args = List.map deref_id_typ yts;
               body = deref_term e1 },
             deref_term e2, p)
  | App(e, es, p) -> App(deref_term e, List.map deref_term es, p)
  | Tuple(es, p) -> Tuple(List.map deref_term es, p)
  | LetTuple(xts, e1, e2, p) -> LetTuple(List.map deref_id_typ xts, deref_term e1, deref_term e2, p)
  | Array(e1, e2, p) -> Array(deref_term e1, deref_term e2, p)
  | Get(e1, e2, p) -> Get(deref_term e1, deref_term e2, p)
  | Put(e1, e2, e3, p) -> Put(deref_term e1, deref_term e2, deref_term e3, p)
  | e -> e

let rec occur r1 = function (* occur check (caml2html: typing_occur) *)
  | Type.Fun(t2s, t2) -> List.exists (occur r1) t2s || occur r1 t2
  | Type.Tuple(t2s) -> List.exists (occur r1) t2s
  | Type.Array(t2) -> occur r1 t2
  | Type.Var(r2) when r1 == r2 -> true
  | Type.Var({ contents = None }) -> false
  | Type.Var({ contents = Some(t2) }) -> occur r1 t2
  | _ -> false

  (*長さが違っていても例外を投げない*)
  let rec conserv_iter f l1 l2 = match l1, l2 with
  | [], _ | _, [] -> (l1, l2)
  | x1::l1r, x2::l2r -> (f x1 x2; conserv_iter f l1r l2r)

let rec unify t1 t2 = (* 型が合うように、型変数への代入をする (caml2html: typing_unify) *)
  match t1, t2 with
  | Type.Unit, Type.Unit | Type.Bool, Type.Bool | Type.Int, Type.Int | Type.Float, Type.Float -> ()
  | Type.Fun(t1s, t1'), Type.Fun(t2s, t2') ->
      (match conserv_iter unify t1s t2s with
        | [], [] -> unify t1' t2'
        | [], r2 -> (
          let part = Type.Fun(r2, t2') in unify t1' part;
          raise (PartApp(r2, t2')))
        | r1, [] -> (
          let part = Type.Fun(r1, t1') in unify part t2';
          raise (PartApp(r1, t1')))
        | _ -> raise (Unify(t1, t2))
      )
  | Type.Tuple(t1s), Type.Tuple(t2s) ->
      (try List.iter2 unify t1s t2s
      with Invalid_argument(_) -> raise (Unify(t1, t2)))
  | Type.Array(t1), Type.Array(t2) -> unify t1 t2
  | Type.Var(r1), Type.Var(r2) when r1 == r2 -> ()
  | Type.Var({ contents = Some(t1') }), _ -> unify t1' t2
  | _, Type.Var({ contents = Some(t2') }) -> unify t1 t2'
  | Type.Var({ contents = None } as r1), _ -> (* 一方が未定義の型変数の場合 (caml2html: typing_undef) *)
      if occur r1 t2 then raise (Unify(t1, t2));
      r1 := Some(t2)
  | _, Type.Var({ contents = None } as r2) ->
      if occur r2 t1 then raise (Unify(t1, t2));
      r2 := Some(t1)
  | _, _ -> raise (Unify(t1, t2))

let rec g env e = (* 型推論ルーチン (caml2html: typing_g) *)
  try
    match e with
    | Unit -> (Type.Unit, e)
    | Bool(_) -> (Type.Bool, e)
    | Int(_) -> (Type.Int, e)
    | Float(_) -> (Type.Float, e)
    | Not(e1, p) ->
        let (t, e1') = g env e1 in
        unify Type.Bool t;
        (Type.Bool, Not(e1', p))
    | Neg(e1, p) ->
        let (t, e1') = g env e1 in
        unify Type.Int t;
        (Type.Int, Neg(e1', p))
    | Add(e1, e2, p) | Sub(e1, e2, p) -> (* 足し算（と引き算）の型推論 (caml2html: typing_add) *)
        let (t1, e1') = g env e1 in
        let (t2, e2') = g env e2 in
        unify Type.Int t1;
        unify Type.Int t2;
        (Type.Int, if match e with Add _ -> true | _ -> false then Add(e1', e2', p) else Sub(e1', e2', p))
    | Shl(e1, i, p) | Shr(e1, i, p) -> (* 掛け算（と割り算）の型推論 (caml2html: typing_add) *)
        let (t1, e1') = g env e1 in
        unify Type.Int t1;
        (Type.Int, if match e with Shl _ -> true | _ -> false then Shl(e1', i, p) else Shr(e1', i, p))
    | FNeg(e1, p) ->
        let (t, e1') = g env e1 in
        unify Type.Float t;
        (Type.Float, FNeg(e1', p))
    | FAdd(e1, e2, p) | FSub(e1, e2, p) | FMul(e1, e2, p) | FDiv(e1, e2, p) ->
        let (t1, e1') = g env e1 in
        let (t2, e2') = g env e2 in
        unify Type.Float t1;
        unify Type.Float t2;
        let e' = match e with
          | FAdd _ -> FAdd(e1', e2', p)
          | FSub _ -> FSub(e1', e2', p)
          | FMul _ -> FMul(e1', e2', p)
          | _ -> FDiv(e1', e2', p)
        in
        (Type.Float, e')
    | Eq(e1, e2, p) ->
        let (t1, e1') = g env e1 in
        let (t2, e2') = g env e2 in
        unify t1 t2;
        (Type.Bool, Eq(e1', e2', p))
    | LE(e1, e2, p) ->
        let (t1, e1') = g env e1 in
        let (t2, e2') = g env e2 in
        unify t1 t2;
        (Type.Bool, LE(e1', e2', p))
    | If(e1, e2, e3, p) ->
        let (t1, e1') = g env e1 in
        unify t1 Type.Bool;
        let (t2, e2') = g env e2 in
        let (t3, e3') = g env e3 in
        unify t2 t3;
        (t2, If(e1', e2', e3', p))
    | Let(xt, e1, e2, p) -> (* letの型推論 (caml2html: typing_let) *)
        let (t1, e1') = g env e1 in
        unify (snd xt) t1;
        let (t2, e2') = g (M.add (fst xt) (snd xt) env) e2 in
        (t2, Let(xt, e1', e2', p))
    | Var(x,_) when M.mem x env -> (M.find x env, e) (* 変数の型推論 (caml2html: typing_var) *)
    | Var(x,_) when M.mem x !extenv -> (M.find x !extenv, e)
    | Var(x,_) -> (* 外部変数の型推論 (caml2html: typing_extvar) *)
        Format.eprintf "free variable %s assumed as external@." x;
        let t = Type.gentyp () in
        extenv := M.add x t !extenv;
        (t, e)
    | LetRec({ name = xt; args = yts; body = e1 }, e2, p) -> (* let recの型推論 (caml2html: typing_letrec) *)
        let t1 = Type.gentyp () in
        let funty = (Type.Fun(List.map snd yts, t1)) in (*関数の引数の数だけは登録しておく*)
        let env' = M.add (fst xt) funty env in
        let (t1', e1') = g (M.add_list yts env') e1 in
        unify t1 t1';
        let (t2, e2') = g env' e2 in
        let xt = (fst xt, funty) in
        (t2, LetRec({ name = xt; args = yts; body = e1' }, e2', p))
    | App(e1, es, p) -> (* 関数適用の型推論 (caml2html: typing_app) *)
        let t = Type.gentyp () in
        let (fn, e1') = g env e1 in
        let (arg_types, es') = List.split (List.map (fun e -> g env e) es) in
        (try unify fn (Type.Fun(arg_types, t)); (t, App(e1', es', p)) with
          PartApp(at, rt) ->
            let (st, en) = p in
            Printf.eprintf "partial apply @ line %d-%d\n" st.pos_lnum en.pos_lnum;
            let name = "___fun" ^ Int.to_string (genfun()) in
            let rec loop al c = (match al with
              | [] -> []
              | t::alr -> ("__a"^(Int.to_string c), t)::(loop alr (c + 1))
            ) in
            let nargs = loop at 0 in
            let oargs = es@(
              List.map (fun (a,_) -> Var(a, p)) nargs
            ) in
            let body = App(e1, oargs, p) in
            let fdef = {name = (name, Fun(at, rt)); args = nargs; body = body} in
            let cls = LetRec(fdef, Var(name, p), p) in
            g env cls
        )
    | Tuple(es, p) -> 
        let (ts, es') = List.split (List.map (fun e -> g env e) es) in
        (Type.Tuple(ts), Tuple(es', p))
    | LetTuple(xts, e1, e2, p) ->
        let (t1, e1') = g env e1 in
        unify (Type.Tuple(List.map snd xts)) t1;
        let (t2, e2') = g (M.add_list xts env) e2 in
        (t2, LetTuple(xts, e1', e2', p))
    | Array(e1, e2, p) -> (* must be a primitive for "polymorphic" typing *)
        let (t1, e1') = g env e1 in
        unify t1 Type.Int;
        let (t2, e2') = g env e2 in
        (Type.Array(t2), Array(e1', e2', p))
    | Get(e1, e2, p) ->
        let t = Type.gentyp () in
        let (t1, e1') = g env e1 in
        unify (Type.Array(t)) t1;
        let (t2, e2') = g env e2 in
        unify Type.Int t2;
        (t, Get(e1', e2', p))
    | Put(e1, e2, e3, p) ->
        let (t1, e1') = g env e1 in
        let (t2, e2') = g env e2 in
        let (t3, e3') = g env e3 in
        unify (Type.Array(t3)) t1;
        unify Type.Int t2;
        (Type.Unit, Put(e1', e2', e3', p))
  with Unify(t1, t2) -> raise (Error(deref_term e, deref_typ t1, deref_typ t2))

let get_pos e = match e with
  Bool(_,p) | Int(_,p) | Float(_,p) | Not(_,p) | Neg(_,p) | Add(_,_,p) | Sub(_,_,p)
  | FNeg(_,p) | FAdd(_,_,p) | FSub(_,_,p) | FMul(_,_,p) | FDiv(_,_,p)
  | Eq(_,_,p) | LE(_,_,p) | If(_,_,_,p) | Let(_,_,_,p) | Var(_,p) 
  | LetRec(_,_,p) | App(_,_,p) | Tuple(_,p) | LetTuple(_,_,_,p)
  | Array(_,_,p) | Get(_,_,p) | Put(_,_,_,p) -> p
  | _ -> (Lexing.dummy_pos, Lexing.dummy_pos)

let f e =
  extenv := M.empty;
(*
  (match deref_typ (g M.empty e) with
  | Type.Unit -> ()
  | _ -> Format.eprintf "warning: final result does not have type unit@.");
*)
  let e' = (try let (t, e') = g M.empty e in unify Type.Unit t; e'
  with Unify _ -> failwith "top level does not have type unit"
  | Error (e, t1, t2) ->
        let (st, en) = get_pos e in
        failwith (Printf.sprintf "typing failed...: %s <-> %s @ (line %d, offset %d)-(%d, %d)"
        (Type.t_str t1) (Type.t_str t2)
        st.pos_lnum st.pos_cnum en.pos_lnum en.pos_cnum)) in
  extenv := M.map deref_typ !extenv;
  deref_term e'
