/**
 * cache_arbiter.sv
 *
 * 2つのマスター (ICache, DCache) からのDRAMアクセス要求を仲裁し、
 * 1つのスレーブ (DRAM) インターフェースに接続するアービタ。
 *
 * - ラウンドロビン仲裁
 * - 一度のトランザクション (要求から応答まで) が完了するまで、
 * もう片方のマスターをブロックします。
 */
module cache_arbiter (
    // ICache (マスター1) からのインターフェース
    master_fifo.fifo icache_fifo,

    // DCache (マスター2) からのインターフェース
    master_fifo.fifo dcache_fifo,

    // DRAM (スレーブ) へのインターフェース
    master_fifo.master dram_fifo,

    // グローバルクロックと非同期リセット
    input logic clk,
    input logic rstn
);
        assign dram_fifo.clk = clk;

    logic [31:0] ret_dir;
    logic [4:0] start;
    logic [4:0] end_;
    //ret_dir[start]に今たまっているretの返す方向を入れる: 0:icache, 1:dcache
    //ret_dir[end_]にdramに流したデータの方向を入れる
    logic grant_to_dram;//dramに流すデータの方向: 0:icache, 1:dcache
    assign grant_to_dram = icache_fifo.req_en ? 1'b0 : 1'b1;
    logic ret_from_dram;//dramから返ってきたデータの方向: 0:icache, 1:dcache
    logic is_full;
    assign is_full = ((end_ + 1) % 32) == start;
    logic is_empty;
    assign is_empty = start == end_;
    //startとend_の更新
    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            start <= 5'b0;
            end_ <= 5'b0;
            ret_dir <= '0;
            ret_from_dram <= 1'b0;
        end else begin
            //dramに流したとき
            if((dram_fifo.req_en && dram_fifo.req_rdy) && !is_full && dram_fifo.req.cmd == 1'b1) begin
                ret_dir[end_] <= grant_to_dram;
                end_ <= end_ + 1;
            end
            //dramから返ってきたとき
            if(!is_empty && dram_fifo.rsp_en && dram_fifo.rsp_rdy) begin
                start <= start + 1;
                ret_from_dram <= ret_dir[start+1];
            end else begin
                ret_from_dram <= ret_dir[start];
            end

        end
    end
    always_comb begin

            // 通常時の処理
            if (grant_to_dram) begin
            // dcache to dram
                icache_fifo.req_rdy = 1'b0;
                if (!is_full) begin
                    dram_fifo.req_en = dcache_fifo.req_en;
                    dram_fifo.req.cmd  = dcache_fifo.req.cmd;
                    dram_fifo.req.addr = dcache_fifo.req.addr;
                    dram_fifo.req.data = dcache_fifo.req.data;
                    dcache_fifo.req_rdy = dram_fifo.req_rdy;

                end else begin
                    dram_fifo.req_en = 1'b0;
                    dcache_fifo.req_rdy = 1'b0;
                end
            end else begin
            // icache to dram
                dcache_fifo.req_rdy = 1'b0;
                if (!is_full) begin
                    dram_fifo.req_en = icache_fifo.req_en;
                    dram_fifo.req.cmd  = icache_fifo.req.cmd;
                    dram_fifo.req.addr = icache_fifo.req.addr;
                    dram_fifo.req.data = icache_fifo.req.data;
                    icache_fifo.req_rdy = dram_fifo.req_rdy;
                end else begin
                    dram_fifo.req_en = 1'b0;
                    icache_fifo.req_rdy = 1'b0;
                end
            end
            // dram to icache/dcache
            if(!is_empty) begin
                if(ret_from_dram == 1'b0) begin
                    // dram to icache
                    dram_fifo.rsp_rdy = icache_fifo.rsp_rdy;
                    icache_fifo.rsp_en = dram_fifo.rsp_en;
                    icache_fifo.rsp.data = dram_fifo.rsp.data;
                    dcache_fifo.rsp_en = 1'b0;
                end else begin
                    // dram to dcache
                    dram_fifo.rsp_rdy = dcache_fifo.rsp_rdy;
                    dcache_fifo.rsp_en = dram_fifo.rsp_en;
                    dcache_fifo.rsp.data = dram_fifo.rsp.data;
                    icache_fifo.rsp_en = 1'b0;

                end
            end else begin
                dram_fifo.rsp_rdy = 1'b0;
                icache_fifo.rsp_en = 1'b0;
                dcache_fifo.rsp_en = 1'b0;
        end
    end
    



    // // 状態定義: どちらのマスターと通信中か
    // typedef enum logic [1:0] {
    //     IDLE,       // どちらも要求していない (仲裁待ち)
    //     SERV_ICACHE, // ICacheの要求を処理中 (DRAMからの応答待ち)
    //     SERV_DCACHE  // DCacheの要求を処理中 (DRAMからの応答待ち)
    // } state_t;

    // state_t state, next_state;

    // // ラウンドロビン仲裁用: 前回どちらにサービスしたか
    // // 1'b0 = ICache, 1'b1 = DCache
    // logic last_served_is_dcache;

    // // --- ステートマシンの状態遷移 ---
    // always_ff @(posedge clk or negedge rstn) begin
    //     if (!rstn) begin
    //         state <= IDLE;
    //     end else begin
    //         state <= next_state;
    //     end
    // end

    // // --- ラウンドロビン優先ビットの更新 ---
    // always_ff @(posedge clk or negedge rstn) begin
    //     if (!rstn) begin
    //         last_served_is_dcache <= 1'b0; // リセット時はICache優先からスタート
    //     end else if (state == IDLE && next_state == SERV_ICACHE) begin
    //         last_served_is_dcache <= 1'b0; // ICacheにサービスしたので、次はDCache優先
    //     end else if (state == IDLE && next_state == SERV_DCACHE) begin
    //         last_served_is_dcache <= 1'b1; // DCacheにサービスしたので、次はICache優先
    //     end
    //     // サービス中は変更しない
    // end



    // // --- 仲裁および信号ルーティング (組み合わせロジック) ---
    // always_comb begin
    //     // --- デフォルト値の設定 ---
    //     next_state = state;

    //     // マスター (ICache) 側
    //     icache_fifo.req_rdy = 1'b0; // デフォルトは要求を受け付けない
    //     icache_fifo.rsp_en  = 1'b0;
    //     // icache_fifo.rsp     = '0;

    //     // マスター (DCache) 側
    //     dcache_fifo.req_rdy = 1'b0; // デフォルトは要求を受け付けない
    //     dcache_fifo.rsp_en  = 1'b0;
    //     // dcache_fifo.rsp     = '0;


    //     // スレーブ (DRAM) 側
    //     dram_fifo.req_en    = 1'b0;
    //     // dram_fifo.req       = '0;
    //     dram_fifo.rsp_rdy   = 1'b0; // デフォルトは応答を受け付けない

    //     // --- 状態ごとの処理 ---
    //     case (state)
    //         IDLE: begin
    //             // --- 仲裁ロジック (ラウンドロビン) ---
    //             logic icache_wants = icache_fifo.req_en;
    //             logic dcache_wants = dcache_fifo.req_en;
    //             logic grant_icache, grant_dcache;

    //             if (last_served_is_dcache) begin
    //                 // 前回 DCache にサービスしたので、ICache を優先
    //                 grant_icache = icache_wants;
    //                 grant_dcache = !icache_wants && dcache_wants;
    //             end else begin
    //                 // 前回 ICache にサービスしたので、DCache を優先
    //                 grant_dcache = dcache_wants;
    //                 grant_icache = !dcache_wants && icache_wants;
    //             end

    //             // --- 仲裁結果の反映 ---
    //             if (grant_icache) begin
    //                 // ICache の要求を DRAM にフォワード
    //                 dram_fifo.req_en = 1'b1;
    //                 // dram_fifo.req.cmd      = icache_fifo.req.cmd;
    //                 dram_fifo.req.cmd      = icache_fifo.req.cmd;
    //                 dram_fifo.req.addr     = icache_fifo.req.addr;
    //                 dram_fifo.req.data    = icache_fifo.req.data;
    //                 icache_fifo.req_rdy = dram_fifo.req_rdy; // DRAM側が準備OKならICacheに伝える

    //                 // DRAMが要求を受け入れたら、状態遷移
    //                 if (dram_fifo.req_rdy) begin
    //                     if (icache_fifo.req.cmd == 1'b0) begin
    //                         next_state = IDLE;
    //                     end
    //                     else begin
    //                         next_state = SERV_ICACHE;
    //                     end
    //                 end
    //             end else if (grant_dcache) begin
    //                 // DCache の要求を DRAM にフォワード
    //                 dram_fifo.req_en = 1'b1;
    //                 dram_fifo.req.cmd      = dcache_fifo.req.cmd;
    //                 dram_fifo.req.addr     = dcache_fifo.req.addr;
    //                 dram_fifo.req.data    = dcache_fifo.req.data;
    //                 dcache_fifo.req_rdy = dram_fifo.req_rdy; // DRAM側が準備OKならDCacheに伝える

    //                 // DRAMが要求を受け入れたら、状態遷移
    //                 if (dram_fifo.req_rdy) begin
    //                     if (dcache_fifo.req.cmd == 1'b0) begin
    //                         next_state = IDLE;
    //                     end
    //                     else begin
    //                         next_state = SERV_DCACHE;
    //                     end
    //                 end
    //             end
    //         end

    //         SERV_ICACHE: begin
    //             // ICache への応答を処理中
    //             // DRAM からの応答を ICache にフォワードする
    //             dram_fifo.rsp_rdy = icache_fifo.rsp_rdy;
    //             icache_fifo.rsp_en = dram_fifo.rsp_en;
    //             icache_fifo.rsp.data    = dram_fifo.rsp.data;

    //             // トランザクション完了 (応答ハンドシェイク成立)
    //             if (dram_fifo.rsp_en && icache_fifo.rsp_rdy) begin
    //                 next_state = IDLE; // 仲裁待ちに戻る
    //             end
    //         end

    //         SERV_DCACHE: begin
    //             // DCache への応答を処理中
    //             // DRAM からの応答を DCache にフォワードする
    //             dram_fifo.rsp_rdy = dcache_fifo.rsp_rdy;
    //             dcache_fifo.rsp_en = dram_fifo.rsp_en;
    //             dcache_fifo.rsp.data    = dram_fifo.rsp.data;

    //             // トランザクション完了 (応答ハンドシェイク成立)
    //             if (dram_fifo.rsp_en && dcache_fifo.rsp_rdy) begin
    //                 next_state = IDLE; // 仲裁待ちに戻る
    //             end
    //         end
    //     endcase
    // end

endmodule