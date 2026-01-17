let rec red2pi x =
  let pi = 3.1415926535897932384626433 in
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
  let s3 = -0.16666 in
  let s5 = 0.0083328 in
  let s7 = -0.0001958 in
  let x2 = x *. x in
  let x3 = x *. x2 in
  let x5 = x3 *. x2 in
  let x7 = x5 *. x2 in
  x +. s3 *. x3 +. s5 *. x5 +. s7 *. x7 in

let rec kernel_cos x =
  let s0 = 1.0 in
  let s2 = -0.5 in
  let s4 = 0.04166 in
  let s6 = -0.001369 in
  let x2 = x *. x in
  let x4 = x2 *. x2 in
  let x6 = x4 *. x2 in
  s0 +. s2 *. x2 +. s4 *. x4 +. s6 *. x6 in

let rec min_caml_sin x =
  let pi = 3.1415926535897932384626433 in
  let (is_plus, a) = if x >= 0.0 then (true, x) else (false, -.x) in
  let a = red2pi a in
  let (is_plus, a) = if a >= pi then (not is_plus, a -. pi) else (is_plus, a) in
  let a = if a >= pi /. 2.0 then pi -. a else a in
  let tmp = if a <= pi /. 4.0 then kernel_sin a else kernel_cos (pi /. 2.0 -. a) in
  addflag tmp is_plus in

let rec min_caml_cos x =
  let pi = 3.1415926535897932384626433 in
  let a = red2pi (abs_float x) in
  let (is_plus, a) = if a >= pi then (false, a -. pi) else (true, a) in
  let (is_plus, a) = if a >= pi /. 2.0 then (not is_plus, pi -. a) else (is_plus, a) in
  let tmp = if a <= pi /. 4.0 then kernel_cos a else kernel_sin (pi /. 2.0 -. a) in
  addflag tmp is_plus in

let rec kernel_atan x =
  let s3 = -0.3333333333 in
  let s5 = 0.2 in
  let s7 = -0.142857 in
  let s9 = 0.111111 in
  let s11 = -0.08976446  in
  let s13 = 0.060035 in
  let x2 = x *. x in
  let x3 = x *. x2 in
  let x5 = x3 *. x2 in
  let x7 = x5 *. x2 in
  let x9 = x7 *. x2 in
  let x11 = x9 *. x2 in
  let x13 = x11 *. x2 in
  x +. s3 *. x3 +. s5 *. x5 +. s7 *. x7 +. s9 *. x9 +. s11 *. x11 +. s13 *. x13 in

let rec min_caml_atan x =
  let pi = 3.1415926535897932384626433 in
  let (is_plus, a) = if x >= 0.0 then (true, x) else (false, -.x) in
  let res = if a < 0.4375 then kernel_atan a else
            if a < 2.4375 then pi /. 4.0 +. kernel_atan ((a -. 1.0) /. (a +. 1.0)) else
              pi /. 2.0 -. kernel_atan (1.0 /. a) in
  addflag res is_plus in

let x = read_float () in
print_float (min_caml_sin x);
print_float (min_caml_cos x);
print_float (min_caml_atan x)
