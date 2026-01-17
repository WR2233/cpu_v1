let rec f x =
  let y = if x = 0 then 0 else x + 1 in y * 100
in print_int (f 10)
