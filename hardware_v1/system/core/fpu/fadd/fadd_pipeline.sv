`timescale 1ns/1ps
/*
 * スティッキービット対応 可変長 右シフタ
 * - 27ビットの仮数部 (ケチビット + 23bit仮数 + GRS 3bit) を入力
 * - G, R, S ビットを正しく生成する
 * - 入力 IN_WIDTH = 27 (1(ケチ) + 23(仮数) + 3(GRS=000))
 * - 出力 OUT_WIDTH = 27
 */
module sticky_right_shifter #(
    parameter IN_WIDTH = 27,
    parameter SHIFT_WIDTH = 8 // シフト量のビット幅 (255まで)
)(
    input  logic [IN_WIDTH-1:0]    data_in,
    input  logic [SHIFT_WIDTH-1:0] shift_amount,
    output logic [IN_WIDTH-1:0]    data_out
);
    logic [IN_WIDTH-1:0] shifted_data;
    logic                sticky_bit;

    // 'shift_amount' に応じてデータを右シフト
    // '>>>' は算術シフトだが、入力は常に正なので論理シフトとして機能
    assign shifted_data = data_in >> shift_amount;

    // スティッキービット (S) の生成
    // シフトによって失われたビット (G, R 以外) に1が1つでもあれば S=1
    // shift_amount が大きい (IN_WIDTH以上) 場合は data_in に 1 があれば S=1
    always_comb begin
        logic [IN_WIDTH-1:0] mask; // ★ 1. 一時変数を 'always_comb' *内* に宣言

        sticky_bit = 1'b0;
        if (shift_amount > 0) begin
            if (shift_amount >= IN_WIDTH) begin
                sticky_bit = |data_in;
            end else begin
                // ★ 2. ビット幅 (IN_WIDTH) を明示した '1' を使う
                // 1. IN_WIDTH ビットの '1' を (shift_amount - 1) だけ左シフト
                mask = (IN_WIDTH'(1) << (shift_amount - 1));
                // 2. マスクを生成 (例: 1000 -> 0111)
                mask = mask - 1; 
                
                sticky_bit = |(data_in & mask);
            end
        end
    end

    // G, R ビットは shifted_data の下位ビットとして自動的に設定される
    // S ビットを出力の最下位ビット [0] に上書きする
    // (入力の GRS は 000 と仮定)
    // G = shifted_data[2], R = shifted_data[1], S = sticky_bit
    assign data_out = {shifted_data[IN_WIDTH-1:1], sticky_bit};

endmodule

/*
 * 26ビット入力 Leading Zero Counter (ZLC)
 * - 入力のMSBから連続する '0' の数を数える (0〜26)
 * - 28bit演算の結果、MSBが '1' (桁上がり) の場合は 0 を返す
 * - '00...0' (すべて0) の場合は 26 を返す
 */
module leading_zero_counter (
    input  logic [25:0] data_in,
    output logic [4:0]  count // 0〜26 を表現 (5bit)
);
    // 26bit入力に対応するプライオリティエンコーダ
    always_comb begin
        count = 5'd26; // デフォルト (すべて0)
        if      (data_in[25]) count = 5'd0;
        else if (data_in[24]) count = 5'd1;
        else if (data_in[23]) count = 5'd2;
        else if (data_in[22]) count = 5'd3;
        else if (data_in[21]) count = 5'd4;
        else if (data_in[20]) count = 5'd5;
        else if (data_in[19]) count = 5'd6;
        else if (data_in[18]) count = 5'd7;
        else if (data_in[17]) count = 5'd8;
        else if (data_in[16]) count = 5'd9;
        else if (data_in[15]) count = 5'd10;
        else if (data_in[14]) count = 5'd11;
        else if (data_in[13]) count = 5'd12;
        else if (data_in[12]) count = 5'd13;
        else if (data_in[11]) count = 5'd14;
        else if (data_in[10]) count = 5'd15;
        else if (data_in[9])  count = 5'd16;
        else if (data_in[8])  count = 5'd17;
        else if (data_in[7])  count = 5'd18;
        else if (data_in[6])  count = 5'd19;
        else if (data_in[5])  count = 5'd20;
        else if (data_in[4])  count = 5'd21;
        else if (data_in[3])  count = 5'd22;
        else if (data_in[2])  count = 5'd23;
        else if (data_in[1])  count = 5'd24;
        else if (data_in[0])  count = 5'd25;
        else                 count = 5'd26; // すべて0
    end
endmodule


/*
 * 3ステージ パイプライン浮動小数点加算器 (fadd)
 *
 * - IEEE 754 単精度 (32bit)
 * - 正規化数のみを想定 (非正規化数、NaN, Inf の特殊処理は含まない)
 * - ユーザー指定の3ステージアルゴリズムに基づき実装
 * - レイテンシ: 3サイクル
 * - リセット: アクティブロー (rst_n)
 */
module fadd_pipeline (
    input  logic        clk,
    input  logic        rst_n,

    input  logic [31:0] input_a,
    input  logic [31:0] input_b,

    output logic [31:0] result
);

    logic [31:0] a, b;
    // 入力レジスタ
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a <= 32'd0;
            b <= 32'd0;
        end else begin
            a <= input_a;
            b <= input_b;
        end
    end
    //================================================================
    // STAGE 1: 比較、アライメント（右シフト）
    //================================================================

    // --- S1 入力デコード ---
    logic        a_sign, b_sign;
    logic [7:0]  a_exp, b_exp;
    logic [22:0] a_mant, b_mant;
    logic [26:0] a_mant_ext, b_mant_ext; // 1(ケチ) + 23(仮数) + 3(GRS)
    logic        a_is_zero, b_is_zero;

    assign a_sign = a[31];
    assign a_exp  = a[30:23];
    assign a_mant = a[22:0];
    assign a_is_zero = (a_exp == 8'd0) & (a_mant == 23'd0); // 0.0入力判定
    
    assign b_sign = b[31];
    assign b_exp  = b[30:23];
    assign b_mant = b[22:0];
    assign b_is_zero = (b_exp == 8'd0) & (b_mant == 23'd0); // 0.0入力判定

    // ケチビットとGRSビット(000)を追加
    assign a_mant_ext = (a_is_zero) ? 27'd0 : {1'b1, a_mant, 3'b000};
    assign b_mant_ext = (b_is_zero) ? 27'd0 : {1'b1, b_mant, 3'b000};

    // --- S1 ロジック ---
    logic        a_is_bigger;
    logic [7:0]  exp_diff;
    logic [26:0] big_mant, small_mant;
    logic [7:0]  big_exp;
    logic        big_sign;
    logic        is_subtraction;
    logic [26:0] shifted_small_mant;

    // 1. 二数の絶対値の大きさを比較 (Step 1)
    assign a_is_bigger = (a_exp > b_exp) || ((a_exp == b_exp) && (a_mant >= b_mant));

    // 2. 右シフト量を計算 (exp_diff)
    assign exp_diff = (a_is_bigger) ? (a_exp - b_exp) : (b_exp - a_exp);

    // 3. 1. の結果を使って「大きい方」を求める (Step 1.3)
    // 5. 「大きい方」の指数部を保持 (Step 1.5)
    // 6. 「大きい方」の符号部を保持 (Step 1.6)
    assign big_mant = (a_is_bigger) ? a_mant_ext : b_mant_ext;
    assign small_mant = (a_is_bigger) ? b_mant_ext : a_mant_ext;
    assign big_exp  = (a_is_bigger) ? a_exp : b_exp;
    assign big_sign = (a_is_bigger) ? a_sign : b_sign;

    // 7. 実際に行う演算の決定 (Step 1.7) (fadd なので加減算のみ)
    assign is_subtraction = a_sign ^ b_sign;

    // 4. 「小さい方をシフトしたもの」を求める (Step 1.4 / Step 2)
    // sticky_right_shifter をインスタンス化
    sticky_right_shifter #(
        .IN_WIDTH(27),
        .SHIFT_WIDTH(8)
    ) u_shifter (
        .data_in(small_mant),
        .shift_amount(exp_diff),
        .data_out(shifted_small_mant)
    );

    // --- S1 -> S2 レジスタ ---
    logic [26:0] big_mant_s2, shifted_small_mant_s2;
    logic [7:0]  big_exp_s2;
    logic        big_sign_s2;
    logic        is_subtraction_s2;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            big_mant_s2           <= 27'd0;
            shifted_small_mant_s2 <= 27'd0;
            big_exp_s2            <= 8'd0;
            big_sign_s2           <= 1'b0;
            is_subtraction_s2     <= 1'b0;
        end else begin
            big_mant_s2           <= big_mant;
            shifted_small_mant_s2 <= shifted_small_mant;
            big_exp_s2            <= big_exp;
            big_sign_s2           <= big_sign;
            is_subtraction_s2     <= is_subtraction;
        end
    end

    //================================================================
    // STAGE 2: 演算 (28bit)、ZLC、丸め準備
    //================================================================

    // --- S2 ロジック ---
    logic [27:0] adder_a, adder_b;
    logic [27:0] mant_result;
    logic [4:0]  zlc_count;
    logic        exp_carry_for_round;
    logic [27:0] mant_shifted1;
    logic        round_up;
    logic [1:0]  round_term;

    // 1. 28bit演算 (Step 4)
    // 符号拡張 (キャリー用)
    assign adder_a = {1'b0, big_mant_s2};
    // 引き算の場合、Bを2の補数にする
    assign adder_b = (is_subtraction_s2) ? ~{1'b0, shifted_small_mant_s2} + 1'b1
                                         : {1'b0, shifted_small_mant_s2};
    assign mant_result = adder_a + adder_b;

    // 2. 1. の結果をZLCにかける (Step 2.2)
    // 28bitの結果のうち、ZLC対象は [27:2] (ケチビットと仮数部)
    // 仕様書通り "先頭26bit" (キャリービット + ケチ + 24bit) を見る
    // 28bit [C, K, M22...M0, G, R, S]
    // ZLC入力 [C, K, M22...M1] (26bit)
    leading_zero_counter u_zlc (
        .data_in(mant_result[27:2]),
        .count(zlc_count) // 0-26
    );

    // 3. 丸めによって指数部に繰り上がりが発生するか否かを判定 (Step 2.3)
    // (ZLC=0,1,2) かつ (ケチ+仮数部がAll 1) かつ (RNEで切り上げ)
    logic [2:0] grs_bits; //= mant_result[2:0]; // [G, R, S]
    logic       lsb; //= mant_result[3]; // 丸め対象のLSB
    logic       guard; //= grs_bits[2];
    logic       round; //= grs_bits[1];
    logic       sticky; //= grs_bits[0];
    
    assign grs_bits = mant_result[2:0];
    assign lsb      = mant_result[3];
    assign guard    = grs_bits[2];
    assign round    = grs_bits[1];
    assign sticky   = grs_bits[0];
    // RNE (Round to Nearest Even)
    // G=1 かつ (R=1 or S=1 or LSB=1)
    assign round_up = guard & (round | sticky | lsb);
    
    // ケチ + 仮数部 (24bit) [26:3] が全て1か
    logic all_ones;
    assign all_ones = &mant_result[26:3];

    // ZLCが0,1,2 (桁上がり or 正規) で、All 1 で、RNE切り上げ の場合
    assign exp_carry_for_round = (zlc_count <= 2) & all_ones & round_up;

    // 4. 1回目の左シフト (Step 2.4)
    // ZLC[1:0] (0-3) だけシフト
    assign mant_shifted1 = mant_result << zlc_count[1:0];

    // 5. 丸め項を決定 (Step 2.5)
    // ZLC=0,1,2 の時だけ丸め項 (round_up) を加算
    assign round_term = (zlc_count <= 2) ? {1'b0, round_up} : 2'b0;

    // 6. 3. の結果を使って指数部に補正を加える (Step 2.6)
    // 7. 符号部はそのまま
    
    // --- S2 -> S3 レジスタ ---
    logic [7:0]  big_exp_s3;
    logic        big_sign_s3;
    logic [4:0]  zlc_count_s3;
    logic        exp_carry_for_round_s3;
    logic [27:0] mant_shifted1_s3;
    logic [1:0]  round_term_s3;
    logic        is_subtraction_s3; // デバッグ用

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            big_exp_s3             <= 8'd0;
            big_sign_s3            <= 1'b0;
            zlc_count_s3           <= 5'd0;
            exp_carry_for_round_s3 <= 1'b0;
            mant_shifted1_s3       <= 28'd0;
            round_term_s3          <= 2'b0;
            is_subtraction_s3      <= 1'b0;
        end else begin
            // 6. 指数部補正 (S2ロジック)
            big_exp_s3             <= big_exp_s2 + exp_carry_for_round;
            big_sign_s3            <= big_sign_s2;
            zlc_count_s3           <= zlc_count;
            exp_carry_for_round_s3 <= exp_carry_for_round;
            mant_shifted1_s3       <= mant_shifted1;
            round_term_s3          <= round_term;
            is_subtraction_s3      <= is_subtraction_s2;
        end
    end

    //================================================================
    // STAGE 3: 正規化 (シフト)、丸め実行、結合
    //================================================================

    // --- S3 ロジック ---
    logic [4:2]  zlc_high_bits;
    logic [27:0] mant_shifted2;
    logic [27:0] mant_rounded;
    logic [22:0] final_mant;
    logic [7:0]  final_exp;
    logic [31:0] result_s3;
    logic        is_zero_result;
    logic [8:0]  exp_sub_zlc;

    assign zlc_high_bits = zlc_count_s3[4:2];

    // 1. 2回目左シフト(Step 5) or 丸め項加算(Step 6)
    // ZLCが 0-3 (high_bits=0) の場合は丸め
    // ZLCが 4以上 (high_bits!=0) の場合はシフト
    assign mant_shifted2 = (mant_shifted1_s3 << {zlc_high_bits, 2'b0});

    // 丸め項加算 (G,R,Sビットの1つ上、[3]の位置に足す)
    assign mant_rounded = mant_shifted2 + (round_term_s3 << 2);

    // 2. 指数部からZLCの出力を引く (Step 5)
    // (加算の桁上がり "1x.xxx" (ZLC=0) は 1bit右シフトするので指数+1 が必要)
    // (引き算の桁落ち "00.1xx" (ZLC=2) は 1bit左シフトするので指数-1 が必要)
    
    // ZLC=0 (1x.xxx) -> 右シフト1 -> 指数+1
    // ZLC=1 (01.xxx) -> シフト0 -> 指数+0
    // ZLC=2 (00.1xx) -> 左シフト1 -> 指数-1
    // ZLC=3 (00.01x) -> 左シフト2 -> 指数-2
    // 一般化: 指数 - (zlc_count - 1)
    // (S2で +exp_carry_for_round しているので、ここで引くのは ZLC-1)
    // ただし、S2の補正で ZLC=0,1,2 の丸め繰り上がりを処理済み。
    // ZLC=0 の桁上がりは「丸め繰り上がり」として処理された。
    // よって、S2で補正済みの指数から zlc_count-1 を引く
    assign exp_sub_zlc = big_exp_s3 - (zlc_count_s3 - 1);


    // 3. ゼロクリア (アンダーフロー/ゼロ) (Step 3.3)
    // ZLC=26以上 (ほぼゼロ) or 指数が負 (アンダーフロー)
    assign is_zero_result = (zlc_count_s3 >= 26) | (exp_sub_zlc[8] == 1'b1);
    
    assign final_exp = (is_zero_result) ? 8'd0 : exp_sub_zlc;

    // 最終的な仮数部 (23bit) を取り出す
    // mant_rounded: [C, K, M22...M0, G, R, S]
    // 欲しいのは [M22...M0]
    // 正規化されたので [26:4] の位置にあるはず
    // ZLC=0 の場合: 1C.K... -> 01.CK... (S2補正) -> [26:4]
    // ZLC=1 の場合: 01.K... -> [26:4]
    // ZLC=2 の場合: 00.1K... -> 01.K... (S3シフト) -> [26:4]
    assign final_mant = (is_zero_result) ? 23'd0 : mant_rounded[26:4];

    // 4. 符号部と指数部と仮数部をくっつけて返す (Step 3.4)
    // 特殊ケース: 引き算で結果が 0 になった場合、符号は 0 (Positive)
    logic final_sign;
    assign final_sign = (is_zero_result) ? 1'b0 : big_sign_s3;

    assign result_s3 = {final_sign, final_exp, final_mant};
    // assign result_s3 = {exp_carry_for_round, zlc_count,27'b0}; // デバッグ用

    // --- S3 -> Output レジスタ ---
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            result <= 32'd0;
        end else begin
            result <= result_s3;
        end
    end

endmodule