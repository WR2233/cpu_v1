let rec f a b c =
  let x =
    let y = a + b in y + c in
  let z = a + b + c in
  x + z in
print_int (f 1 2 3)
