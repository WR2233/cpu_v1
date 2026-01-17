let rec read_num tmp =
  let c = read_byte() in
  if c < 48 then (tmp, c) else
  if c > 57 then (tmp, c) else
  read_num (tmp * 10 + (c - 48))
in
let rec read_isub _ =
  let c = read_byte() in
  if c = 32 then read_isub() else (*\s**)
  if c = 10 then read_isub() else
  if c = 45 then
    let (num, c) = read_num 0 in (-num, c) else
  if c < 48 then (0, c) else
  if c > 57 then (0, c) else
    read_num (c - 48)
  in
let rec min_caml_read_int _ =
  let (num, _) = read_isub() in num
in
let rec min_caml_read_float _ =
  let c = read_byte() in
  if c = 32 then min_caml_read_float() else (*\s**)
  if c = 10 then min_caml_read_float() else
  if c = 45 then -.min_caml_read_float() else (*-*)
  if c < 48 then 0.0 else
  if c > 57 then 0.0 else
  let (num, c) = read_num (c - 48) in
  if c = 46 then
    let (f,_) = read_num 0 in
    let rec smallen f = if f < 1.0 then f else smallen (f /. 10.0) in
    (float_of_int num) +. smallen (float_of_int f)
  else float_of_int num
  in
let rec print_num f =
  if f < 9.5 then print_byte ((int_of_float f) + 48) else
  let nf = floor (f *. 0.1) in
  let d = int_of_float (f -. nf *. 10.0) in
  let _ = print_num nf in
  print_byte (d + 48)
  in
let rec min_caml_print_int num =
  if num < 0 then (let _ = print_byte 45 in print_num (float_of_int (-num))) else
  print_num (float_of_int num)
in
let rec min_caml_print_float num =
  if num < 0.0 then
    let _ = print_byte 45 in min_caml_print_float (-.num) else
  let _ = print_num (floor num) in
  let _ = print_byte 46 in
  let f = num -. floor num in
  print_num (float_of_int (int_of_float (f *. 1000000.0)))
in
min_caml_print_int (min_caml_read_int ());
min_caml_print_float (min_caml_read_float ())