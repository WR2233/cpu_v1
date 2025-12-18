package types_pkg;

    typedef enum logic [7:0] {
        // no operation
        NOPE,

        // Loads
        LB,
        LW,
        FLW,

        // Integer immediates
        ADDI,
        SLLI,
        SLTI,
        SLTIU,
        XORI,
        SRLI,
        SRAI,
        ORI,
        ANDI,

        // Integer upper-immediate
        AUIPC,
        LUI,

        // Stores
        SW,
        FSW,

        // Integer R-type
        ADD,
        SUB,
        SLL,
        SLT,
        SLTU,
        XOR,
        SRL,
        SRA,
        AND,
        OR,

        // Float comparisons
        FLE,
        FLT,
        FEQ,

        // Float arithmetic
        FADD,
        FSUB,
        FMUL,
        FDIV,

        // Float sign operations
        FSGNJ,
        FSGNJN,
        FSGNJX,

        // Float special ops
        FISQRT,
        FINV,
        FLOOR,
        FTOI,
        ITOF,
        FSQRT,

        // Branches
        BEQ,
        BNE,
        BLT,
        BGE,
        BLTU,
        BGEU,

        // Jumps
        JALR,
        JAL,

        // Move ops
        FMV,

        // System ops
        EBREAK

    } inst_t;

endpackage

