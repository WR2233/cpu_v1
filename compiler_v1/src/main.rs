use to_riscv::parser::parse_prog;
use to_riscv::vmachine::VMProg;
// use to_riscv::emit::Emitter;
use to_riscv::emit_asm::AsmEmitter;
// use to_riscv::del_array::delete_unnecessary_array;
use to_riscv::register_alloc::RegisterAllocator;

use std::io::Read;
use std::io::Write;
use std::fs::File;
use std::env::args;

fn main() {
    let mut args = args();
    let filepath = args.nth(1).expect("no input file");
    // let mut stdin = stdin();
    let mut f = File::open(filepath.clone() + ".closure").expect("failed to open input file");
    let mut input = String::new();
    f.read_to_string(&mut input).expect("read error");
    eprintln!("parsing closure.t...");
    let (_, res) = parse_prog(&input).expect("parse error");
    eprintln!("parsing finished");
    let mut f = File::create(filepath.clone() + ".before_TACE").unwrap();
    write!(f, "{}", res).expect("failed to write");
    // delete_unnecessary_array(&mut res);
    let mut f = File::create(filepath.clone() + ".after_TACE").unwrap();
    write!(f, "{}", res).expect("failed to write");
    let prog = VMProg::from(res);

    let mut f = File::create(filepath.clone() + ".vm").unwrap();
    write!(f, "{}", prog).expect("failed to write");

    let allocator = RegisterAllocator::new();
    let reg_prog = allocator.reg_alloc(&prog);
    let mut f = File::create(filepath.clone() + ".reg").unwrap();
    write!(f, "{}", reg_prog).expect("failed to write");
    // for func in &reg_prog.topfn {
    //     eprintln!("{:?}", func.body);
    // }
    // let f = File::create(filepath.clone() + ".riscv").unwrap();
    // let mut emitter = Emitter::new(prog, f);
    // emitter.run().expect("emitter error");
    let f = File::create(filepath + ".riscvreg").unwrap();
    let mut emitter = AsmEmitter::new(f);
    emitter.run(reg_prog).expect("emitter error");
}
