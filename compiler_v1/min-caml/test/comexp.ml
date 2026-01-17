let rec f a b c = 
  let x = a + b in
  let y = a + b + c in
  let z = a + b + c in
  x + y + z in

let a = 1 in
let b = 2 in
let c = 3 in
print_int (f a b c)