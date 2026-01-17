type t =
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
  | LetRec of fundef * t * Util.pos
  | App of Id.t * Id.t list * Util.pos
  | Tuple of Id.t list * Util.pos
  | LetTuple of (Id.t * Type.t) list * Id.t * t * Util.pos
  | Get of Id.t * Id.t * Util.pos
  | Put of Id.t * Id.t * Id.t * Util.pos
  | ExtArray of Id.t * Util.pos
  | ExtFunApp of Id.t * Id.t list * Util.pos
and fundef = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t }

val fv : t -> S.t
val f : Syntax.t -> t
val get_pos : t -> Util.pos
val display_t : out_channel -> t -> unit
