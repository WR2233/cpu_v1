type t = (* MinCamlの型を表現するデータ型 (caml2html: type_t) *)
  | Unit
  | Bool
  | Int
  | Float
  | Fun of t list * t (* arguments are uncurried *)
  | Tuple of t list
  | Array of t
  | Var of t option ref

let rec t_str = function
  | Unit -> "U"
  | Bool -> "B"
  | Int -> "I"
  | Float -> "F"
  | Fun(args, e) ->
      Printf.sprintf "C([%s], %s)" (t_loop args) (t_str e) (*Closure*)
  | Tuple(tl) -> Printf.sprintf "T([%s])" (t_loop tl)
  | Array(t) -> Printf.sprintf "A(%s)" (t_str t)
  | Var(op) ->
      (match !op with 
        | Some(t) -> Printf.sprintf "V(%s)" (t_str t)
        | None -> "V(?)"
      )
and t_loop l = match l with
  | [] -> ""
  | last::[] -> t_str last
  | l0::ll -> Printf.sprintf "%s, %s" (t_str l0) (t_loop ll)

let gentyp () = Var(ref None) (* 新しい型変数を作る *)
