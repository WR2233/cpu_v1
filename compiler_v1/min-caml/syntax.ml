type t = (* MinCamlの構文を表現するデータ型 (caml2html: syntax_t) *)
  | Unit
  | Bool of bool * Util.pos (* * Lexing.position を追加したい*)
  | Int of int * Util.pos
  | Float of float * Util.pos
  | Not of t * Util.pos
  | Neg of t * Util.pos
  | Add of t * t * Util.pos
  | Sub of t * t * Util.pos
  | Shl of t * int * Util.pos
  | Shr of t * int * Util.pos
  | FNeg of t * Util.pos
  | FAdd of t * t * Util.pos
  | FSub of t * t * Util.pos
  | FMul of t * t * Util.pos
  | FDiv of t * t * Util.pos
  | Eq of t * t * Util.pos
  | LE of t * t * Util.pos
  | If of t * t * t * Util.pos
  | Let of (Id.t * Type.t) * t * t * Util.pos
  | Var of Id.t * Util.pos
  | LetRec of fundef * t * Util.pos
  | App of t * t list * Util.pos
  | Tuple of t list * Util.pos
  | LetTuple of (Id.t * Type.t) list * t * t * Util.pos
  | Array of t * t * Util.pos
  | Get of t * t * Util.pos
  | Put of t * t * t * Util.pos
and fundef = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t }

(*無名関数用の関数*)
let funcount = ref 0
let genfun _ =
  let res = !funcount in
  funcount := res + 1; res

let rec take e = match e with
  | Int(x, _) -> x
  | Neg(e', _) -> -(take e')
  | _ -> failwith "not a const number"

let rec decompose e x i p =
  if x = 0 then Int(0, p) else
  if x = 1 then Shl(e, i, p) else
  if (x mod 2) = 1 then
    Add((Shl(e, i, p)), decompose e (x/2) (i+1) p, p)
  else
    decompose e (x/2) (i+1) p

let rec log x i = if x = 0 then -1 else if x = 1 then i else
  if (x mod 2) = 1 then -1 else log (x/2) (i+1)

(* let parse_error e =  *)

(*以下追加コード*)
let rec display_t_sub f t depth =
  Printf.fprintf f "%*s" (depth * 2) "";
  let _ = match t with
    | Unit -> (Printf.fprintf f "Unit\n")
    | Bool(b,_) -> (Printf.fprintf f "Bool %s\n" (if b then "true" else "false"))
    | Int(n,_) -> (Printf.fprintf f "Int %d\n" n)
    | Float(n,_) -> (Printf.fprintf f "Float %f\n" n)
    | Not(b,_) -> (Printf.fprintf f "Not\n";display_t_sub f b (depth + 1))
    | Neg(n,_) -> (Printf.fprintf f "Neg\n";display_t_sub f n (depth + 1))
    | Add(a, b,_) -> (Printf.fprintf f "Add\n";display_t_sub f a (depth + 1);display_t_sub f b (depth + 1);)
    | Sub(a, b,_) -> (Printf.fprintf f "Sub\n";display_t_sub f a (depth + 1);display_t_sub f b (depth + 1);)
    | Shl(a, b,_) -> (Printf.fprintf f "Shl\n";display_t_sub f a (depth + 1);Printf.fprintf f "%*s%d\n" ((depth + 1) * 2) "" b;)
    | Shr(a, b,_) -> (Printf.fprintf f "Shr\n";display_t_sub f a (depth + 1);Printf.fprintf f "%*s%d\n" ((depth + 1) * 2) "" b;)
    | FNeg(n,_) -> (Printf.fprintf f "FNeg\n";display_t_sub f n (depth + 1))
    | FAdd(a, b,_) -> (Printf.fprintf f "FAdd\n";display_t_sub f a (depth + 1);display_t_sub f b (depth + 1);)
    | FSub(a, b,_) -> (Printf.fprintf f "FSub\n";display_t_sub f a (depth + 1);display_t_sub f b (depth + 1);)
    | FMul(a, b,_) -> (Printf.fprintf f "FMul\n";display_t_sub f a (depth + 1);display_t_sub f b (depth + 1);)
    | FDiv(a, b,_) -> (Printf.fprintf f "FDiv\n";display_t_sub f a (depth + 1);display_t_sub f b (depth + 1);)
    | Eq(a, b,_) -> (Printf.fprintf f "Eq\n";display_t_sub f a (depth + 1);display_t_sub f b (depth + 1);)
    | LE(a, b,_) -> (Printf.fprintf f "Le\n";display_t_sub f a (depth + 1);display_t_sub f b (depth + 1);)
    | If(c, a, b,_) -> (Printf.fprintf f "If\n";display_t_sub f c (depth + 1);display_t_sub f a (depth + 1);display_t_sub f b (depth + 1);)
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
    | App(fn, args,_) -> (Printf.fprintf f "App\n";display_t_sub f fn (depth + 1);
      let rec loop l = match l with
        | [] -> ()
        | a::lr -> display_t_sub f a (depth + 1); loop lr
      in loop args)
    | Tuple(l,_) -> (Printf.fprintf f "(Tuple)\n";
        let rec loop l = match l with
        | [] -> ()
        | a::lr -> display_t_sub f a (depth + 1); loop lr
      in loop l;
    )
    | LetTuple(l, e1, e2,_) -> (
        Printf.fprintf f "Tuple(";
        let rec loop l = match l with
        | [] -> ()
        | a::[] -> let (n, _) = a in Printf.fprintf f "%s" n
        | a::lr -> let (n, _) = a in (Printf.fprintf f "%s, " n; loop lr)
        in loop l;
        Printf.fprintf f ")\n";
        display_t_sub f e1 (depth + 1);
        Printf.fprintf f "%*sIN\n" (depth * 2) "";
        display_t_sub f e2 (depth + 1)
    )
    | Array(a, b,_) -> (Printf.fprintf f "[Array]\n";display_t_sub f a (depth + 1);display_t_sub f b (depth + 1);)
    | Get(arr, idx,_) -> (Printf.fprintf f "Get\n";display_t_sub f arr (depth + 1);display_t_sub f idx (depth + 1);)
    | Put(arr, idx, v,_) -> (Printf.fprintf f "Put\n";display_t_sub f arr (depth + 1);display_t_sub f idx (depth + 1);display_t_sub f v (depth + 1);)
  in ()

let display_t f t = display_t_sub f t 0
