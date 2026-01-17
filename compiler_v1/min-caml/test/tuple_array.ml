let t = (1, 2, 3) in
let a = Array.make 4 0.0 in
a.(0) <- 100.0;
a.(1) <- 200.0;
a.(2) <- 300.0;
a.(3) <- 400.0;
let rec f t =
let (x, _, _) = t in x in
print_float (a.(0));
print_int (f t)