(* give names to intermediate values (K-normalization) *)

type t = (* K正規化後の式 (caml2html: knormal_t) *)
  | Unit
  | Int of int * Util.pos
  | Float of float * Util.pos
  | Neg of Id.t * Util.pos
  | Add of Id.t * Id.t * Util.pos
  | Sub of Id.t * Id.t * Util.pos
  | Shl of Id.t * int * Util.pos
  | Shr of Id.t * int * Util.pos
  | FNeg of Id.t * Util.pos
  | FAdd of Id.t * Id.t * Util.pos
  | FSub of Id.t * Id.t * Util.pos
  | FMul of Id.t * Id.t * Util.pos
  | FDiv of Id.t * Id.t * Util.pos
  | IfEq of Id.t * Id.t * t * t * Util.pos (* 比較 + 分岐 (caml2html: knormal_branch) *)
  | IfLE of Id.t * Id.t * t * t * Util.pos (* 比較 + 分岐 *)
  | Let of (Id.t * Type.t) * t * t * Util.pos
  | Var of Id.t * Util.pos
  | LetRec of fundef * t * Util.pos
  | App of Id.t * Id.t list * Util.pos
  | Tuple of Id.t list * Util.pos
  | LetTuple of (Id.t * Type.t) list * Id.t * t * Util.pos
  | Get of Id.t * Id.t * Util.pos
  | Put of Id.t * Id.t * Id.t * Util.pos
  | ExtArray of Id.t * Util.pos
  | ExtFunApp of Id.t * Id.t list * Util.pos
and fundef = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t }

let get_pos e = match e with
  Int(_,p) | Float(_,p) | Neg(_,p) | Add(_,_,p) | Sub(_,_,p)
  | FNeg(_,p) | FAdd(_,_,p) | FSub(_,_,p) | FMul(_,_,p) | FDiv(_,_,p)
  | IfEq(_,_,_,_,p) | IfLE(_,_,_,_,p) | Let(_,_,_,p) | Var(_,p) 
  | LetRec(_,_,p) | App(_,_,p) | Tuple(_,p) | LetTuple(_,_,_,p)
  | ExtArray(_,p) | ExtFunApp(_,_,p) | Get(_,_,p) | Put(_,_,_,p) -> p
  | _ -> (Lexing.dummy_pos, Lexing.dummy_pos)

let rec fv = function (* 式に出現する（自由な）変数 (caml2html: knormal_fv) *)
  | Unit | Int(_) | Float(_) | ExtArray(_) -> S.empty
  | Neg(x,_) | FNeg(x,_) -> S.singleton x
  | Add(x, y,_) | Sub(x, y,_) | FAdd(x, y,_) | FSub(x, y,_) | FMul(x, y,_) | FDiv(x, y,_) | Get(x, y,_) -> S.of_list [x; y]
  | Shl(x,_,_) | Shr(x,_,_) -> S.of_list [x]
  | IfEq(x, y, e1, e2,_) | IfLE(x, y, e1, e2,_) -> S.add x (S.add y (S.union (fv e1) (fv e2)))
  | Let((x, t), e1, e2,_) -> S.union (fv e1) (S.remove x (fv e2))
  | Var(x,_) -> S.singleton x
  | LetRec({ name = (x, t); args = yts; body = e1 }, e2,_) ->
      let zs = S.diff (fv e1) (S.of_list (List.map fst yts)) in
      S.diff (S.union zs (fv e2)) (S.singleton x)
  | App(x, ys,_) -> S.of_list (x :: ys)
  | Tuple(xs,_) | ExtFunApp(_, xs,_) -> S.of_list xs
  | Put(x, y, z,_) -> S.of_list [x; y; z]
  | LetTuple(xs, y, e,_) -> S.add y (S.diff (fv e) (S.of_list (List.map fst xs)))

let insert_let (e, t) k = (* letを挿入する補助関数 (caml2html: knormal_insert) *)
  match e with
  | Var(x,_) -> k x
  | _ ->
      let x = Id.gentmp t in
      let e', t' = k x in
      let p = get_pos e in
      Let((x, t), e, e', p), t'

let rec g env = function (* K正規化ルーチン本体 (caml2html: knormal_g) *)
  | Syntax.Unit -> Unit, Type.Unit
  | Syntax.Bool(b, p) -> Int((if b then 1 else 0), p), Type.Int (* 論理値true, falseを整数1, 0に変換 (caml2html: knormal_bool) *)
  | Syntax.Int(i, p) -> Int(i, p), Type.Int
  | Syntax.Float(d, p) -> Float(d, p), Type.Float
  | Syntax.Not(e,p) -> g env (Syntax.If(e, Syntax.Bool(false, p), Syntax.Bool(true, p), p))
  | Syntax.Neg(e, p) ->
      insert_let (g env e)
        (fun x -> Neg(x, p), Type.Int)
  | Syntax.Add(e1, e2, p) -> (* 足し算のK正規化 (caml2html: knormal_add) *)
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y -> Add(x, y, p), Type.Int))
  | Syntax.Sub(e1, e2, p) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y -> Sub(x, y, p), Type.Int))
  | Syntax.Shl(e1, i, p) -> (* 足し算のK正規化 (caml2html: knormal_add) *)
      insert_let (g env e1) (fun x -> Shl(x, i, p), Type.Int)
  | Syntax.Shr(e1, i, p) ->
      insert_let (g env e1) (fun x -> Shr(x, i, p), Type.Int)
  | Syntax.FNeg(e, p) ->
      insert_let (g env e)
        (fun x -> FNeg(x, p), Type.Float)
  | Syntax.FAdd(e1, e2, p) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y -> FAdd(x, y, p), Type.Float))
  | Syntax.FSub(e1, e2, p) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y -> FSub(x, y, p), Type.Float))
  | Syntax.FMul(e1, e2, p) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y -> FMul(x, y, p), Type.Float))
  | Syntax.FDiv(e1, e2, p) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y -> FDiv(x, y, p), Type.Float))
  | Syntax.Eq (_,_,p) | Syntax.LE (_,_,p) as cmp ->
      g env (Syntax.If(cmp, Syntax.Bool(true, p), Syntax.Bool(false, p), p))
  | Syntax.If(Syntax.Not(e1, p), e2, e3,_) -> g env (Syntax.If(e1, e3, e2, p)) (* notによる分岐を変換 (caml2html: knormal_not) *)
  | Syntax.If(Syntax.Eq(e1, e2, _), e3, e4, p2) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y ->
              let e3', t3 = g env e3 in
              let e4', t4 = g env e4 in
              IfEq(x, y, e3', e4', p2), t3))
  | Syntax.If(Syntax.LE(e1, e2,_), e3, e4, p) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y ->
              let e3', t3 = g env e3 in
              let e4', t4 = g env e4 in
              IfLE(x, y, e3', e4', p), t3))
  | Syntax.If(e1, e2, e3, p) -> g env (Syntax.If(Syntax.Eq(e1, Syntax.Bool(false, p), p), e3, e2, p)) (* 比較のない分岐を変換 (caml2html: knormal_if) *)
  | Syntax.Let((x, t), e1, e2, p) ->
      let e1', t1 = g env e1 in
      let e2', t2 = g (M.add x t env) e2 in
      Let((x, t), e1', e2', p), t2
  | Syntax.Var(x, p) when M.mem x env -> Var(x, p), M.find x env
  | Syntax.Var(x, p) -> (* 外部配列の参照 (caml2html: knormal_extarray) *)
      (match M.find x !Typing.extenv with
      | Type.Array(_) as t -> ExtArray(x, p), t
      | _ -> 
        let (st, en) = p in
        failwith (Printf.sprintf "external variable %s does not have an array type: (line %d, offset %d)-(%d, %d)"
        x st.pos_lnum st.pos_cnum en.pos_lnum en.pos_cnum))
  | Syntax.LetRec({ Syntax.name = (x, t); Syntax.args = yts; Syntax.body = e1 }, e2, p) ->
      let env' = M.add x t env in
      let e2', t2 = g env' e2 in
      let e1', t1 = g (M.add_list yts env') e1 in
      LetRec({ name = (x, t); args = yts; body = e1' }, e2', p), t2
  | Syntax.App(e, e2s, p) -> (* 外部関数の呼び出し (caml2html: knormal_extfunapp) *)
      (match e with
        | Syntax.Var(f, _) when not (M.mem f env) ->
        (match M.find f !Typing.extenv with
        | Type.Fun(_, t) ->
            let rec bind xs = function (* "xs" are identifiers for the arguments *)
              | [] -> ExtFunApp(f, xs, p), t
              | e2 :: e2s ->
                  insert_let (g env e2)
                    (fun x -> bind (xs @ [x]) e2s) in
            bind [] e2s (* left-to-right evaluation *)
        | _ -> assert false)
      | e1-> (match g env e1 with
        | _, Type.Fun(_, t) as g_e1 ->
            insert_let g_e1
              (fun f ->
                let rec bind xs = function (* "xs" are identifiers for the arguments *)
                  | [] -> App(f, xs, p), t
                  | e2 :: e2s ->
                      insert_let (g env e2)
                        (fun x -> bind (xs @ [x]) e2s) in
                bind [] e2s) (* left-to-right evaluation *)
        | _ -> assert false)
      )
  | Syntax.Tuple(es,p) ->
      let rec bind xs ts = function (* "xs" and "ts" are identifiers and types for the elements *)
        | [] -> Tuple(xs, p), Type.Tuple(ts)
        | e :: es ->
            let _, t as g_e = g env e in
            insert_let g_e
              (fun x -> bind (xs @ [x]) (ts @ [t]) es) in
      bind [] [] es
  | Syntax.LetTuple(xts, e1, e2, p) ->
      insert_let (g env e1)
        (fun y ->
          let e2', t2 = g (M.add_list xts env) e2 in
          LetTuple(xts, y, e2', p), t2)
  | Syntax.Array(e1, e2, p) ->
      insert_let (g env e1)
        (fun x ->
          let _, t2 as g_e2 = g env e2 in
          insert_let g_e2
            (fun y ->
              let l =
                match t2 with
                | Type.Float -> "create_float_array"
                | _ -> "create_array" in
              ExtFunApp(l, [x; y], p), Type.Array(t2)))
  | Syntax.Get(e1, e2, p) ->
      (match g env e1 with
      |        _, Type.Array(t) as g_e1 ->
          insert_let g_e1
            (fun x -> insert_let (g env e2)
                (fun y -> Get(x, y, p), t))
      | _ -> assert false)
  | Syntax.Put(e1, e2, e3, p) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y -> insert_let (g env e3)
                (fun z -> Put(x, y, z, p), Type.Unit)))

let f e = fst (g M.empty e)

(*以下追加コード*)
let rec display_t_sub f t depth =
  Printf.fprintf f "%*s" (depth * 2) ""; (*インデント*)
  let _ = match t with
    | Unit -> (Printf.fprintf f "Unit\n")
    | Int(n,_) -> (Printf.fprintf f "Int %d\n" n)
    | Float(n,_) -> (Printf.fprintf f "Float %f\n" n)
    | Neg(n,_) -> (Printf.fprintf f "Neg %s\n" n;)
    | Add(a, b,_) -> (Printf.fprintf f "Add %s %s\n" a b;)
    | Sub(a, b,_) -> (Printf.fprintf f "Sub %s %s\n" a b;)
    | Shl(a, b,_) -> (Printf.fprintf f "Shl %s %d\n" a b;)
    | Shr(a, b,_) -> (Printf.fprintf f "Shr %s %d\n" a b;)
    | FNeg(n,_) -> (Printf.fprintf f "FNeg %s\n" n;)
    | FAdd(a, b,_) -> (Printf.fprintf f "FAdd %s %s\n" a b;)
    | FSub(a, b,_) -> (Printf.fprintf f "FSub %s %s\n" a b;)
    | FMul(a, b,_) -> (Printf.fprintf f "FMul %s %s\n" a b;)
    | FDiv(a, b,_) -> (Printf.fprintf f "FDiv %s %s\n" a b;)
    | IfEq(a, b, e1, e2,_) -> (Printf.fprintf f "If Eq %s %s\n" a b;display_t_sub f e1 (depth + 1);display_t_sub f e2 (depth + 1);)
    | IfLE(a, b, e1, e2,_) -> (Printf.fprintf f "If Le %s %s\n" a b;display_t_sub f e1 (depth + 1);display_t_sub f e2 (depth + 1);)
    | Let((n, _), e1, e2,_) -> (
        Printf.fprintf f "Let %s\n" n;
        display_t_sub f e1 (depth + 1);
        Printf.fprintf f "%*sIN\n" (depth * 2) "";
        display_t_sub f e2 (depth + 1);
    )
    | Var(n,_) -> (Printf.fprintf f "Var %s\n" n;)
    | LetRec(def, e,_) -> (
        let name = match def.name with | (n, _) -> n in
        Printf.fprintf f "LetRec %s " name;
        let _ = List.map (fun a -> match a with (n,_) -> Printf.fprintf f "%s " n) def.args in
        Printf.fprintf f "\n";
        display_t_sub f def.body (depth + 1);
        Printf.fprintf f "%*sIN\n" (depth * 2) "";
        display_t_sub f e (depth + 1);
      )
    | App(name, args,_) -> (Printf.fprintf f "App %s " name;
      let rec loop l = match l with
        | [] -> ()
        | a::lr -> Printf.fprintf f "%s " a; loop lr
      in loop args;
      Printf.fprintf f "\n";)
    | Tuple(cont,_) -> (
        Printf.fprintf f "Tuple(";
        let rec loop l = match l with
        | [] -> ()
        | a::[] -> Printf.fprintf f "%s" a
        | a::lr -> (Printf.fprintf f "%s, " a; loop lr)
      in loop cont;
      Printf.fprintf f ")\n";
    )
    | LetTuple(l, e1, e2,_) -> (
        Printf.fprintf f "Tuple(";
        let rec loop l = match l with
        | [] -> ()
        | a::[] -> let (n, _) = a in Printf.fprintf f "%s" n
        | a::lr -> let (n, _) = a in (Printf.fprintf f "%s, " n; loop lr)
        in loop l;
        Printf.fprintf f ") = %s\n" e1;
        Printf.fprintf f "%*sIN\n" (depth * 2) "";
        display_t_sub f e2 (depth + 1)
    )
    | Get(arr, idx,_) -> (Printf.fprintf f "Get %s %s\n" arr idx)
    | Put(arr, idx, v,_) -> (Printf.fprintf f "Put %s %s %s\n" arr idx v)
    | ExtFunApp(fn, args,_) -> (Printf.fprintf f "ExtFunApp %s " fn; (*副作用がある場合にこれになる？*)
      let rec loop l = match l with
        | [] -> ()
        | a::lr -> Printf.fprintf f "%s " a; loop lr
      in loop args;
      Printf.fprintf f "\n";)
    | ExtArray(arr,_) -> (Printf.fprintf f "Array %s\n" arr)
  in ()

let display_t f t = display_t_sub f t 0
