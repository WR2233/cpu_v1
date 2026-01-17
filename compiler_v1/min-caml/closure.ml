type closure = { entry : Id.l; actual_fv : Id.t list }
type t = (* クロージャ変換後の式 (caml2html: closure_t) *)
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
  | IfEq of Id.t * Id.t * t * t * Util.pos
  | IfLE of Id.t * Id.t * t * t * Util.pos
  | Let of (Id.t * Type.t) * t * t * Util.pos
  | Var of Id.t * Util.pos
  | MakeCls of (Id.t * Type.t) * closure * t * Util.pos
  | AppCls of Id.t * Id.t list * Util.pos
  | AppDir of Id.l * Id.t list * Util.pos
  | Tuple of Id.t list * Util.pos
  | LetTuple of (Id.t * Type.t) list * Id.t * t * Util.pos
  | Get of Id.t * Id.t * Util.pos
  | Put of Id.t * Id.t * Id.t * Util.pos
  | ExtArray of Id.l * Util.pos
type fundef = { name : Id.l * Type.t;
                args : (Id.t * Type.t) list;
                formal_fv : (Id.t * Type.t) list;
                body : t }
type prog = Prog of fundef list * t

let get_pos e = match e with
  Int(_,p) | Float(_,p) | Neg(_,p) | Add(_,_,p) | Sub(_,_,p)
  | FNeg(_,p) | FAdd(_,_,p) | FSub(_,_,p) | FMul(_,_,p) | FDiv(_,_,p)
  | IfEq(_,_,_,_,p) | IfLE(_,_,_,_,p) | Let(_,_,_,p) | Var(_,p) 
  | AppCls(_,_,p) | AppDir(_,_,p) | Tuple(_,p) | LetTuple(_,_,_,p)
  | ExtArray(_,p) | MakeCls(_,_,_,p) | Get(_,_,p) | Put(_,_,_,p) -> p
  | _ -> (Lexing.dummy_pos, Lexing.dummy_pos)

let rec fv = function
  | Unit | Int(_) | Float(_) | ExtArray(_) -> S.empty
  | Neg(x,_) | FNeg(x,_) -> S.singleton x
  | Add(x, y,_) | Sub(x, y,_) | FAdd(x, y,_) | FSub(x, y,_) | FMul(x, y,_) | FDiv(x, y,_) | Get(x, y,_) -> S.of_list [x; y]
  | Shl(x,_,_) | Shr(x,_,_) -> S.of_list [x]
  | IfEq(x, y, e1, e2,_) | IfLE(x, y, e1, e2,_) -> S.add x (S.add y (S.union (fv e1) (fv e2)))
  | Let((x, t), e1, e2,_) -> S.union (fv e1) (S.remove x (fv e2))
  | Var(x,_) -> S.singleton x
  | MakeCls((x, t), { entry = l; actual_fv = ys }, e,_) -> S.remove x (S.union (S.of_list ys) (fv e))
  | AppCls(x, ys,_) -> S.of_list (x :: ys)
  | AppDir(_, xs,_) | Tuple(xs,_) -> S.of_list xs
  | Put(x, y, z,_) -> S.of_list [x; y; z]
  | LetTuple(xs, y, e,_) -> S.add y (S.diff (fv e) (S.of_list (List.map fst xs)))

let toplevel : fundef list ref = ref []

let rec g env known = function (* クロージャ変換ルーチン本体 (caml2html: closure_g) *)
  | KNormal.Unit -> Unit
  | KNormal.Int(i, p) -> Int(i, p)
  | KNormal.Float(d, p) -> Float(d, p)
  | KNormal.Neg(x, p) -> Neg(x, p)
  | KNormal.Add(x, y, p) -> Add(x, y, p)
  | KNormal.Sub(x, y, p) -> Sub(x, y, p)
  | KNormal.Shl(x, y, p) -> Shl(x, y, p)
  | KNormal.Shr(x, y, p) -> Shr(x, y, p)
  | KNormal.FNeg(x, p) -> FNeg(x, p)
  | KNormal.FAdd(x, y, p) -> FAdd(x, y, p)
  | KNormal.FSub(x, y, p) -> FSub(x, y, p)
  | KNormal.FMul(x, y, p) -> FMul(x, y, p)
  | KNormal.FDiv(x, y, p) -> FDiv(x, y, p)
  | KNormal.IfEq(x, y, e1, e2, p) -> IfEq(x, y, g env known e1, g env known e2, p)
  | KNormal.IfLE(x, y, e1, e2, p) -> IfLE(x, y, g env known e1, g env known e2, p)
  | KNormal.Let((x, t), e1, e2, p) -> Let((x, t), g env known e1, g (M.add x t env) known e2, p)
  | KNormal.Var(x, p) -> Var(x, p)
  | KNormal.LetRec({ KNormal.name = (x, t); KNormal.args = yts; KNormal.body = e1 }, e2, p) -> (* 関数定義の場合 (caml2html: closure_letrec) *)
      (* 関数定義let rec x y1 ... yn = e1 in e2の場合は、
         xに自由変数がない(closureを介さずdirectに呼び出せる)
         と仮定し、knownに追加してe1をクロージャ変換してみる *)
      let toplevel_backup = !toplevel in
      let env' = M.add x t env in
      let known' = S.add x known in
      let e1' = g (M.add_list yts env') known' e1 in
      (* 本当に自由変数がなかったか、変換結果e1'を確認する *)
      (* 注意: e1'にx自身が変数として出現する場合はclosureが必要!
         (thanks to nuevo-namasute and azounoman; test/cls-bug2.ml参照) *)
      let zs = S.diff (fv e1') (S.of_list (List.map fst yts)) in
      let known', e1' =
        if S.is_empty zs then known', e1' else
        (* 駄目だったら状態(toplevelの値)を戻して、クロージャ変換をやり直す *)
        (Format.eprintf "free variable(s) %s found in function %s@." (Id.pp_list (S.elements zs)) x;
         Format.eprintf "function %s cannot be directly applied in fact@." x;
         toplevel := toplevel_backup;
         let e1' = g (M.add_list yts env') known e1 in
         known, e1') in
      let zs = S.elements (S.diff (fv e1') (S.add x (S.of_list (List.map fst yts)))) in (* 自由変数のリスト *)
      let zts = List.map (fun z -> (z, M.find z env')) zs in (* ここで自由変数zの型を引くために引数envが必要 *)
      toplevel := { name = (Id.L(x), t); args = yts; formal_fv = zts; body = e1' } :: !toplevel; (* トップレベル関数を追加 *)
      let e2' = g env' known' e2 in
      if S.mem x (fv e2') then (* xが変数としてe2'に出現するか *)
        MakeCls((x, t), { entry = Id.L(x); actual_fv = zs }, e2', p) (* 出現していたら削除しない *)
      else
        (Format.eprintf "eliminating closure(s) %s@." x;
         e2') (* 出現しなければMakeClsを削除 *)
  | KNormal.App(x, ys, p) when S.mem x known -> (* 関数適用の場合 (caml2html: closure_app) *)
      Format.eprintf "directly applying %s@." x;
      AppDir(Id.L(x), ys, p)
  | KNormal.App(f, xs, p) -> AppCls(f, xs, p)
  | KNormal.Tuple(xs, p) -> Tuple(xs, p)
  | KNormal.LetTuple(xts, y, e, p) -> LetTuple(xts, y, g (M.add_list xts env) known e, p)
  | KNormal.Get(x, y, p) -> Get(x, y, p)
  | KNormal.Put(x, y, z, p) -> Put(x, y, z, p)
  | KNormal.ExtArray(x, p) -> ExtArray(Id.L(x), p)
  | KNormal.ExtFunApp(x, ys, p) -> AppDir(Id.L("min_caml_" ^ x), ys, p)

let f e =
  toplevel := [];
  let e' = g M.empty S.empty e in
  Prog(List.rev !toplevel, e')

(*以下出力用の関数*)
let pos_str p =
  let (st, en) = p in
  let pos_str_sub (p: Lexing.position) = Printf.sprintf "(\"%s\", %d, %d, %d)"
  p.pos_fname p.pos_lnum p.pos_bol p.pos_cnum in
  Printf.sprintf "(%s, %s)" (pos_str_sub st) (pos_str_sub en)

let rec output_t f t = match t with
  | Unit -> Printf.fprintf f "Unit"
  | Int(n, p) -> Printf.fprintf f "Int(%d, %s)" n (pos_str p)
  | Float(n, p) -> Printf.fprintf f "Float(%f, %s)" n (pos_str p)
  | Neg(n, p) -> Printf.fprintf f "Neg(%s, %s)" n (pos_str p)
  | Add(a, b, p) -> Printf.fprintf f "Add(%s, %s, %s)" a b (pos_str p)
  | Sub(a, b, p) -> Printf.fprintf f "Sub(%s, %s, %s)" a b (pos_str p)
  | Shl(a, b, p) -> Printf.fprintf f "Shl(%s, %d, %s)" a b (pos_str p)
  | Shr(a, b, p) -> Printf.fprintf f "Shr(%s, %d, %s)" a b (pos_str p)
  | FNeg(n, p) -> Printf.fprintf f "FNeg(%s, %s)" n (pos_str p)
  | FAdd(a, b, p) -> Printf.fprintf f "FAdd(%s, %s, %s)" a b (pos_str p)
  | FSub(a, b, p) -> Printf.fprintf f "FSub(%s, %s, %s)" a b (pos_str p)
  | FMul(a, b, p) -> Printf.fprintf f "FMul(%s, %s, %s)" a b (pos_str p)
  | FDiv(a, b, p) -> Printf.fprintf f "FDiv(%s, %s, %s)" a b (pos_str p)
  | IfEq(a, b, x, y, p) -> (
      Printf.fprintf f "IfEq(%s, %s, " a b;
      output_t f x;
      Printf.fprintf f ", ";
      output_t f y;
      Printf.fprintf f ", %s)" (pos_str p))
  | IfLE(a, b, x, y, p) -> (
      Printf.fprintf f "IfLe(%s, %s, " a b;
      output_t f x;
      Printf.fprintf f ", ";
      output_t f y;
      Printf.fprintf f ", %s)" (pos_str p))
  | Let(v, x, y, p) -> (
      Printf.fprintf f "Let(";
      output_var f v;
      Printf.fprintf f ", ";
      output_t f x;
      Printf.fprintf f ", ";
      output_t f y;
      Printf.fprintf f ", %s)" (pos_str p)
    )
  | Var(n, p) -> Printf.fprintf f "Var(%s, %s)" n (pos_str p)
  | AppDir(L(n), args, p) -> (
      Printf.fprintf f "AppDir(%s, [%s], %s)" n (strloop args) (pos_str p))
  | AppCls(v, args, p) -> 
      Printf.fprintf f "AppCls(%s, [%s], %s)" v (strloop args) (pos_str p)
  | MakeCls(v, cls, e, p) -> (
      Printf.fprintf f "MakeCls(";
      output_var f v;
      Printf.fprintf f ", ";
      output_cls f cls;
      Printf.fprintf f ", ";
      output_t f e;
      Printf.fprintf f ", %s)" (pos_str p)
  )
  | LetTuple(vl, tv, e, p) -> (
      Printf.fprintf f "LetTuple([";
      varloop f vl;
      Printf.fprintf f "], %s, " tv;
      output_t f e;
      Printf.fprintf f ", %s)" (pos_str p))
  | Get(arr, oft, p) -> Printf.fprintf f "Get(%s, %s, %s)" arr oft (pos_str p)
  | Put(arr, oft, v, p) -> Printf.fprintf f "Put(%s, %s, %s, %s)" arr oft v (pos_str p)
  | ExtArray(L(l), p) -> Printf.fprintf f "ExtArray(%s, %s)" l (pos_str p)
  | Tuple(vl, p) -> Printf.fprintf f "Tuple([%s], %s)" (strloop vl) (pos_str p)
and strloop strs = match strs with
    | [] -> ""
    | last::[] -> last
    | str::lstrs -> Printf.sprintf "%s, %s" str (strloop lstrs)

and output_var f (v: (Id.t * Type.t)) =
  let (n, t) = v in
  let ts = Type.t_str t in
  Printf.fprintf f "(%s, %s)" n ts

and varloop f vars = match vars with
    | [] -> ()
    | last::[] -> output_var f last
    | var::lvars -> (output_var f var; Printf.fprintf f ", "; varloop f lvars)

and output_cls f cls =
  let L(l) = cls.entry in
  Printf.fprintf f "(%s, [%s])" l (strloop cls.actual_fv)

let output_fundef f (fd: fundef) =
  let (L(name), ty) = fd.name in
  Printf.fprintf f "((%s, %s), [" name (Type.t_str ty);
  varloop f fd.args;
  Printf.fprintf f "], [";
  varloop f fd.formal_fv;
  Printf.fprintf f "], ";
  output_t f fd.body;
  Printf.fprintf f ")"

let output_prog f p =
  Printf.fprintf f "([";
  let rec fdloop fds = match fds with
  | [] -> ()
  | last::[] -> output_fundef f last
  | fd::lfds -> (output_fundef f fd; Printf.fprintf f ", "; fdloop lfds)
  in let Prog(fds, body) = p in
  fdloop fds;
  Printf.fprintf f "], ";
  output_t f body;
  Printf.fprintf f ")";