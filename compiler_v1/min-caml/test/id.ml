let rec id x = x in
let _ = print_int (id 1) in
let _ = print_float (id 1.9) in
let (x, y) = id (1, 2) in
print_int x