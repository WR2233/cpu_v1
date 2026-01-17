let f = fun x -> x + 1 in
let g = fun x y -> x + y in
let h = fun x -> fun y -> x - y in
let x = read_int() in
let y = int_of_float (read_float()) in
print_int (f x);
print_int (g x y);
print_int ((h x) y)