type closure = { entry : Id.l; actual_fv : Id.t list }
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

val get_pos : t -> Util.pos
val fv : t -> S.t
val f : KNormal.t -> prog
val output_prog : out_channel -> prog -> unit
