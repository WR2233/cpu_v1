let rec f t =
  let (x, y, z) = t in
  print_int x in
let n = read_int () in
if n = 0 then
  let x = 1 in
  let y = 2 in
  let z = 3 in
  let t = (x, y, z) in
  f t
else
  print_int 1000