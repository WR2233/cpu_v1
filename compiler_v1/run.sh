#!/bin/bash

(cd min-caml; dune build; ./_build/default/main.exe -inline 60 ../$1;)

ulimit -s 33554432
RUST_MIN_STACK=33554432
if [ $2 = "-r" ]; then
    cargo run --release $1
else
    cargo run $1
fi

filename=$(basename $1)
python assembler.py $1.riscvreg asm/io.riscvreg asm/lib.riscv asm/mathblt.riscv asm/math.riscvreg asm/const.riscv -o output/"$filename".hex