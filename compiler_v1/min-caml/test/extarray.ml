extarray.(0) <- Array.make 4 10;
extarray.(0).(2) <- 1000;
fextarray.(10) <- 3.14;
print_int extarray.(0).(0);
print_int extarray.(0).(2);
print_int (int_of_float fextarray.(10))
