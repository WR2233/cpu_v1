let rec a = a in
let rec f _ =
  let x = read_float() in
  let y = a x in
  let _ = print_int (int_of_float y) in f() in
f()