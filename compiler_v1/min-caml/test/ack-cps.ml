let rec ack' x y k =
 if x <= 0 then k (y+1) else
 if y <= 0 then ack' (x-1) 1 k
 else ack' x (y-1) (fun n -> ack' (x-1) n k)
in
ack' 3 10 (fun r -> print_int r)