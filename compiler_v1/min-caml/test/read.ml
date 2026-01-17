let rec f _ =
  let x = read_float() in
  if x = 0.0 then () else
    (print_float x; print_float (-.x); f())
in f()