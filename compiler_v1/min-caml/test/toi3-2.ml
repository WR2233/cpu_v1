let n = 3 in
let rec f x =
  if x < n then f (x + 1) else x in
print_int (f 0)