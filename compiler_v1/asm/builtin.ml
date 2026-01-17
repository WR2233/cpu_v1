let pi = 3.1415926535897932384626433 in
let rec red2pi x =
  let p = pi *. 2.0 in
  let rec loop p =
    if x < p then p
    else loop (p *. 2.0) in
  let p = loop p in
  let rec loop2 a p =
    if a < pi *. 2.0 then a
    else
      let a = if a >= p then a -. p else a in
      loop2 a (p /. 2.0) in
  loop2 x p in

let rec addflag x f =
  if f then x else -. x in

let rec kernel_sin x =
  let b3: int32 = Int32.of_int 0xbe2aaaac in
  let s3 = Int32.float_of_bits b3 in
  let b5: int32 = Int32.of_int 0x3c088666 in
  let s5 = Int32.float_of_bits b5 in
  let b7: int32 = Int32.of_int 0xb94d64b6 in
  let s7 = Int32.float_of_bits b7 in
  let x2 = x *. x in
  let x3 = x *. x2 in
  let x5 = x3 *. x2 in
  let x7 = x5 *. x2 in
  x +. s3 *. x3 +. s5 *. x5 +. s7 *. x7 in

let rec kernel_cos x =
  let s0 = 1.0 in
  let s2 = -0.5 in
  let b4: int32 = Int32.of_int 0x3d2aa789 in
  let s4 = Int32.float_of_bits b4 in
  let b6: int32 = Int32.of_int 0xbab38106 in
  let s6 = Int32.float_of_bits b6 in
  let x2 = x *. x in
  let x4 = x2 *. x2 in
  let x6 = x4 *. x2 in
  s0 +. s2 *. x2 +. s4 *. x4 +. s6 *. x6 in

let rec mysin x =
  let (is_plus, a) = if x >= 0.0 then (true, x) else (false, -.x) in
  let a = red2pi a in
  let (is_plus, a) = if a >= pi then (not is_plus, a -. pi) else (is_plus, a) in
  let a = if a >= pi /. 2.0 then pi -. a else a in
  let tmp = if a <= pi /. 4.0 then kernel_sin a else kernel_cos (pi /. 2.0 -. a) in
  addflag tmp is_plus in

let rec mycos x =
  let a = if x >= 0.0 then x else -. x in
  let a = red2pi a in
  let (is_plus, a) = if a >= pi then (false, a -. pi) else (true, a) in
  let (is_plus, a) = if a >= pi /. 2.0 then (not is_plus, pi -. a) else (is_plus, a) in
  let tmp = if a <= pi /. 4.0 then kernel_cos a else kernel_sin (pi /. 2.0 -. a) in
  addflag tmp is_plus in

let rec kernel_atan x =
  let b3: int32 = Int32.of_int 0xbeaaaaaa in
  let s3 = Int32.float_of_bits b3 in
  let b5: int32 = Int32.of_int 0x3e4ccccd in
  let s5 = Int32.float_of_bits b5 in
  let b7: int32 = Int32.of_int 0xbe124925 in
  let s7 = Int32.float_of_bits b7 in
  let b9: int32 = Int32.of_int 0x3de38e38 in
  let s9 = Int32.float_of_bits b9 in
  let b11: int32 = Int32.of_int 0xbdb7d66e in
  let s11 = Int32.float_of_bits b11 in
  let b13: int32 = Int32.of_int 0x3d75e7c5 in
  let s13 = Int32.float_of_bits b13 in
  let x2 = x *. x in
  let x3 = x *. x2 in
  let x5 = x3 *. x2 in
  let x7 = x5 *. x2 in
  let x9 = x7 *. x2 in
  let x11 = x9 *. x2 in
  let x13 = x11 *. x2 in
  x +. s3 *. x3 +. s5 *. x5 +. s7 *. x7 +. s9 *. x9 +. s11 *. x11 +. s13 *. x13 in

let rec myatan x =
  let (is_plus, a) = if x >= 0.0 then (true, x) else (false, -.x) in
  let res = if a < 0.4375 then kernel_atan a else
            if a < 2.4375 then pi /. 4.0 +. kernel_atan ((a -. 1.0) /. (a +. 1.0)) else
              pi /. 2.0 -. kernel_atan (1.0 /. a) in
  addflag res is_plus in

let x = read_float () in
let res = atan x in
let myres = myatan x in
Printf.printf "%.10f, 0x%08x\n" myres (Int32.to_int (Int32.bits_of_float myres));
Printf.printf "%.10f, 0x%08x\n" res (Int32.to_int (Int32.bits_of_float res))
