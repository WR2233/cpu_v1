let rec f x =
  let mat = Array.make x 0.0 in
  let rec g i =
    if i < x then
    (mat.(i) <- 1.0; g (i + 1))
    else () in
  g 0;
  mat.(0)
  in print_float (f 4)