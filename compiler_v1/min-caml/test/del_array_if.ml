let rec f x =
  let arr = Array.make 4 10 in
  let _ = if x < 4 then
    arr.(x) <- 100
  else () in
  arr.(0) in
print_int (f 2)
