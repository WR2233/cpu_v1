use core::panic;
use std::io::{BufWriter, Write};
use std::{collections::HashMap, fs::File};

use crate::asm::{Asm, AsmProg, BinOpKind, CmpKind, FReg, IorF, Reg, Regs, UniOpKind, ValueBox};
use ordered_float::OrderedFloat;

pub struct AsmEmitter {
    float_table: HashMap<OrderedFloat<f32>, String>,
    emitting_main: bool,
    // prog: AsmProg,
    writer: BufWriter<File>,
}

impl AsmEmitter {
    #[allow(non_upper_case_globals)]
    pub const hp: Reg = Reg::tp;
    #[allow(non_upper_case_globals)]
    pub const itmp: Reg = Reg::s10;
    #[allow(non_upper_case_globals)]
    pub const ftmp: FReg = FReg::fs11;
    #[allow(non_upper_case_globals)]
    pub const clsr: Reg = Reg::s9;

    pub fn new(f: File) -> Self {
        let writer = BufWriter::new(f);
        Self {
            float_table: HashMap::new(),
            emitting_main: false,
            // prog,
            writer,
        }
    }

    pub fn run(&mut self, prog: AsmProg) -> std::io::Result<()> {
        eprintln!("emitting assembly...");
        for f in prog.topfn {
            self.emitting_main = f.name.0 == "MAIN";
            writeln!(self.writer, "{}:", f.name.0)?;
            writeln!(
                self.writer,
                "\taddi {}, {}, {}",
                Reg::sp,
                Reg::sp,
                -(f.spill_count as i32 + 1) * 4
            )?;
            for code in f.body {
                match code {
                    Asm::Li(a, imm) => {
                        if -4096 <= imm && imm <= 4095 {
                            writeln!(self.writer, "\taddi {}, zero, {}", a, imm)?;
                        } else {
                            writeln!(self.writer, "\tlui {}, {}", a, imm)?;
                            writeln!(self.writer, "\taddi {}, {}, {}", a, a, imm)?;
                        }
                    }
                    Asm::FLi(a, imm) => {
                        if let Some(label) = self.float_table.get(&OrderedFloat(imm)) {
                            writeln!(self.writer, "\tla {}, {}", Self::itmp, label)?;
                            writeln!(self.writer, "\tflw {}, 0({})", a, Self::itmp)?;
                        } else {
                            let label = format!(".f{:.6}f", imm);
                            writeln!(self.writer, "\tla {}, {}", Self::itmp, label)?;
                            writeln!(self.writer, "\tflw {}, 0({})", a, Self::itmp)?;
                            self.float_table.insert(OrderedFloat(imm), label);
                        }
                    }
                    Asm::Mv(v1, v2) => {
                        let spr = Reg::sp;
                        let clsr = Self::clsr;
                        if v1 != v2 {
                            match (v1, v2) {
                                (ValueBox::Reg(r1), ValueBox::Reg(r2)) => {
                                    writeln!(self.writer, "\tadd {}, zero, {}", r1, r2)?;
                                }
                                (ValueBox::FReg(r1), ValueBox::FReg(r2)) => {
                                    writeln!(self.writer, "\tfsgnj {}, {}, {}", r1, r2, r2)?;
                                }
                                (ValueBox::Reg(r), ValueBox::Mem(oft, IorF::I)) => {
                                    writeln!(self.writer, "\tlw {}, {}(sp)", r, oft)?;
                                }
                                (ValueBox::Mem(oft, IorF::I), ValueBox::Reg(r)) => {
                                    writeln!(self.writer, "\tsw {}, {}(sp)", r, oft)?;
                                }
                                (ValueBox::FReg(r), ValueBox::Mem(oft, IorF::F)) => {
                                    writeln!(self.writer, "\tflw {}, {}(sp)", r, oft)?;
                                }
                                (ValueBox::Mem(oft, IorF::F), ValueBox::FReg(r)) => {
                                    writeln!(self.writer, "\tfsw {}, {}(sp)", r, oft)?;
                                }
                                (ValueBox::Reg(r), ValueBox::Cls(oft, IorF::I)) => {
                                    writeln!(self.writer, "\tlw {}, {}({})", r, oft, Self::clsr)?;
                                }
                                (ValueBox::FReg(r), ValueBox::Cls(oft, IorF::F)) => {
                                    writeln!(self.writer, "\tflw {}, {}({})", r, oft, Self::clsr)?;
                                }
                                (ValueBox::Mem(oft1, IorF::I), ValueBox::Mem(oft2, IorF::I)) => {
                                    writeln!(self.writer, "\tlw {}, {}(sp)", Self::itmp, oft2)?;
                                    writeln!(self.writer, "\tsw {}, {}(sp)", Self::itmp, oft1)?;
                                }
                                (ValueBox::Mem(oft1, IorF::F), ValueBox::Mem(oft2, IorF::F)) => {
                                    writeln!(self.writer, "\tflw {}, {}(sp)", Self::ftmp, oft2)?;
                                    writeln!(self.writer, "\tfsw {}, {}(sp)", Self::ftmp, oft1)?;
                                }
                                (ValueBox::Mem(oft1, IorF::I), ValueBox::Cls(oft2, IorF::I)) => {
                                    writeln!(
                                        self.writer,
                                        "\tlw {}, {}({})",
                                        Self::itmp,
                                        oft2,
                                        clsr
                                    )?;
                                    writeln!(
                                        self.writer,
                                        "\tsw {}, {}({})",
                                        Self::itmp,
                                        oft1,
                                        spr
                                    )?;
                                }
                                (ValueBox::Mem(oft1, IorF::F), ValueBox::Cls(oft2, IorF::F)) => {
                                    writeln!(
                                        self.writer,
                                        "\tflw {}, {}({})",
                                        Self::ftmp,
                                        oft2,
                                        clsr
                                    )?;
                                    writeln!(
                                        self.writer,
                                        "\tfsw {}, {}({})",
                                        Self::ftmp,
                                        oft1,
                                        spr
                                    )?;
                                }
                                _ => unreachable!("{:?} <- {:?}", v1, v2),
                            }
                        }
                    }
                    Asm::UniOp(op, v, a) => match op {
                        UniOpKind::Neg => {
                            if let (Regs::Reg(v), Regs::Reg(a)) = (v, a) {
                                writeln!(self.writer, "\tsub {}, zero, {}", v, a)?;
                            }
                        }
                        UniOpKind::FNeg => {
                            if let (Regs::FReg(v), Regs::FReg(a)) = (v, a) {
                                writeln!(self.writer, "\tfneg {}, {}", v, a)?;
                            }
                        }
                    },
                    Asm::BinOp(op, v, a, b) => {
                        let opstr = match op {
                            BinOpKind::Add => "add",
                            BinOpKind::Sub => "sub",
                            BinOpKind::FAdd => "fadd",
                            BinOpKind::FSub => "fsub",
                            BinOpKind::FMul => "fmul",
                            BinOpKind::FDiv => "fdiv",
                            BinOpKind::FEql => "feq",
                            BinOpKind::FLeq => "fle",
                            BinOpKind::Get => "",
                            _ => unreachable!(),
                        };
                        match op {
                            BinOpKind::Get => {
                                writeln!(self.writer, "\tslli {}, {}, 2", Self::itmp, b)?;
                                writeln!(
                                    self.writer,
                                    "\tadd {}, {}, {}",
                                    Self::itmp,
                                    a,
                                    Self::itmp
                                )?;
                                if let Regs::Reg(_) = v {
                                    writeln!(self.writer, "\tlw {}, 0({})", v, Self::itmp)?;
                                } else {
                                    writeln!(self.writer, "\tflw {}, 0({})", v, Self::itmp)?
                                }
                            }
                            _ => writeln!(self.writer, "\t{} {}, {}, {}", opstr, v, a, b)?,
                        }
                    }
                    Asm::BinOpImm(op, v, a, imm) => {
                        let opstr = match op {
                            BinOpKind::Add => "addi",
                            BinOpKind::Sub => "",
                            BinOpKind::Shl => "slli",
                            BinOpKind::Shr => "srai",
                            BinOpKind::Get => "",
                            _ => unreachable!(),
                        };
                        if imm <= -4096 || 4095 <= imm {
                            panic!()
                        }
                        match op {
                            BinOpKind::Get => {
                                if imm <= -1024 || 1023 <= imm {
                                    panic!()
                                }
                                if let Regs::Reg(_) = v {
                                    writeln!(self.writer, "\tlw {}, {}({})", v, imm * 4, a)?;
                                } else {
                                    writeln!(self.writer, "\tflw {}, {}({})", v, imm * 4, a)?;
                                }
                            }
                            BinOpKind::Sub => {
                                writeln!(self.writer, "\taddi {}, {}, {}", v, a, -imm)?
                            }
                            _ => writeln!(self.writer, "\t{} {}, {}, {}", opstr, v, a, imm)?,
                        }
                    }
                    Asm::Call(f) => {
                        if !self.emitting_main {
                            writeln!(self.writer, "\tsw {}, 0({})", Reg::ra, Reg::sp)?;
                        }
                        writeln!(self.writer, "\tjal {}, {}", Reg::ra, f)?;
                        if !self.emitting_main {
                            writeln!(self.writer, "\tlw {}, 0({})", Reg::ra, Reg::sp)?;
                        }
                    }
                    Asm::CallCls => {
                        writeln!(self.writer, "\tlw {}, 0({})", Self::itmp, Self::clsr)?;

                        if !self.emitting_main {
                            writeln!(self.writer, "\tsw {}, 0({})", Reg::ra, Reg::sp)?;
                        }
                        writeln!(self.writer, "\tjalr {}, {}, 0", Reg::ra, Self::itmp)?;
                        if !self.emitting_main {
                            writeln!(self.writer, "\tlw {}, 0({})", Reg::ra, Reg::sp)?;
                        }
                    }
                    Asm::MakeCls(r, label, vars) => {
                        writeln!(self.writer, "\tla {}, {}", Self::itmp, label)?;
                        writeln!(self.writer, "\tsw {}, 0({})", Self::itmp, Self::hp)?;

                        for (i, vbox) in vars.iter().enumerate() {
                            let (opstr, r) = match vbox {
                                Some(ValueBox::Reg(r)) => ("sw", Regs::Reg(*r)),
                                Some(ValueBox::FReg(r)) => ("fsw", Regs::FReg(*r)),
                                Some(ValueBox::Mem(oft, IorF::I)) => {
                                    writeln!(
                                        self.writer,
                                        "\tlw {}, {}({})",
                                        Self::itmp,
                                        oft,
                                        Reg::sp
                                    )?;
                                    ("sw", Regs::Reg(Self::itmp))
                                }
                                Some(ValueBox::Mem(oft, IorF::F)) => {
                                    writeln!(
                                        self.writer,
                                        "\tflw {}, {}({})",
                                        Self::ftmp,
                                        oft,
                                        Reg::sp
                                    )?;
                                    ("fsw", Regs::FReg(Self::ftmp))
                                }
                                Some(ValueBox::Cls(oft, IorF::I)) => {
                                    writeln!(
                                        self.writer,
                                        "\tlw {}, {}({})",
                                        Self::itmp,
                                        oft,
                                        Self::clsr
                                    )?;
                                    ("sw", Regs::Reg(Self::itmp))
                                }
                                Some(ValueBox::Cls(oft, IorF::F)) => {
                                    writeln!(
                                        self.writer,
                                        "\tflw {}, {}({})",
                                        Self::ftmp,
                                        oft,
                                        Self::clsr
                                    )?;
                                    ("fsw", Regs::FReg(Self::ftmp))
                                }
                                _ => continue,
                            };
                            writeln!(
                                self.writer,
                                "\t{} {}, {}({})",
                                opstr,
                                r,
                                (i + 1) * 4,
                                Self::hp
                            )?;
                        }

                        writeln!(self.writer, "\tadd {}, zero, {}", r, Self::hp)?;
                        writeln!(
                            self.writer,
                            "\taddi {}, {}, {}",
                            Self::hp,
                            Self::hp,
                            (vars.len() + 1) * 4
                        )?;

                        if (vars.len() + 1) * 4 > 4096 {
                            panic!("to many vars in closure");
                        }
                    }
                    Asm::Ret(ret) => {
                        if self.emitting_main {
                            writeln!(self.writer, "\tebreak")?;
                        } else {
                            if let Some(vbox) = ret {
                                match vbox {
                                    ValueBox::Reg(r) if r != Reg::a0 => {
                                        writeln!(self.writer, "\tadd {}, zero, {}", Reg::a0, r)?;
                                    }
                                    ValueBox::FReg(r) if r != FReg::fa0 => {
                                        writeln!(
                                            self.writer,
                                            "\tfsgnj {}, {}, {}",
                                            FReg::fa0,
                                            r,
                                            r
                                        )?;
                                    }
                                    ValueBox::Mem(oft, IorF::I) => {
                                        writeln!(self.writer, "\tlw {}, {}(sp)", Reg::a0, oft)?;
                                    }
                                    ValueBox::Mem(oft, IorF::F) => {
                                        writeln!(self.writer, "\tflw {}, {}(sp)", FReg::fa0, oft)?;
                                    }
                                    ValueBox::Cls(_, _) => {
                                        unimplemented!();
                                        // writeln!(self.writer, "\tlw {}, {}(sp)", Reg::a0, idx * 4)?;
                                    }
                                    _ => (),
                                }
                            }
                            writeln!(
                                self.writer,
                                "\taddi {}, {}, {}",
                                Reg::sp,
                                Reg::sp,
                                (f.spill_count as i32 + 1) * 4
                            )?;
                            writeln!(self.writer, "\tret")?;
                        }
                    }
                    Asm::Branch(op, a, b, label) => {
                        let opstr = match op {
                            CmpKind::Eq => "beq",
                            CmpKind::Ne => "bne",
                            CmpKind::Ge => "bge",
                        };
                        writeln!(self.writer, "\t{} {}, {}, {}", opstr, a, b, label)?
                    }
                    Asm::Label(label) => writeln!(self.writer, "{}:", label)?,
                    Asm::Put(arr, idx, var) => {
                        let swstr = match var {
                            Regs::FReg(_) => "fsw",
                            Regs::Reg(_) => "sw",
                        };

                        writeln!(self.writer, "\tslli {}, {}, 2", Self::itmp, idx)?;
                        writeln!(self.writer, "\tadd {}, {}, {}", Self::itmp, arr, Self::itmp)?;
                        writeln!(self.writer, "\t{} {}, 0({})", swstr, var, Self::itmp)?;
                    }
                    Asm::PutImm(arr, idx, var) => {
                        let swstr = match var {
                            Regs::FReg(_) => "fsw",
                            Regs::Reg(_) => "sw",
                        };

                        writeln!(self.writer, "\t{} {}, {}({})", swstr, var, idx * 4, arr)?;
                    }
                    Asm::Raw(raw) => writeln!(self.writer, "\t{}", raw)?,
                }
            }
        }

        if self.float_table.len() > 0 {
            writeln!(self.writer, ".data")?;
            for (f, l) in &self.float_table {
                writeln!(self.writer, "{}:", l)?;
                writeln!(self.writer, "\t.word 0x{:x}", f.to_bits())?;
            }
        }

        Ok(())
    }
}
