let rec fact n = if n < 2.0 then 1.0 else (n *. fact(n -. 1.0)) in print_float (fact 10.0)
