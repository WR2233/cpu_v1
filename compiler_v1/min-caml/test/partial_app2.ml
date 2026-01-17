let rec gcd a b = if a <= 0 then b else if a <= b then
  let g = gcd a in g (b - a) else let h = gcd b in h (a - b) in
let rec id x = x in
print_int (((id gcd) 72) 84);
print_int ((id gcd) 72 84)
