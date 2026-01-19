# Python Simulator

RISC-Vベースの独自ISAに対応したPython実装のシミュレータです。

## 構成

- `data_types.py` - データ型定義（命令フォーマット、マシン状態）
- `decoder.py` - 命令デコーダ
- `order.py` - レジスタファイル、メモリ管理、MMIO実装
- `executor.py` - 命令実行ロジック
- `simulator.py` - メインシミュレータループ
- `debugger.py` - インタラクティブデバッガ機能
- `config.yaml` - レジスタ初期値の設定

## サポートする命令

### 整数演算 (RV32I)
#### R型命令
- `add rd, rs1, rs2` - 加算
- `sub rd, rs1, rs2` - 減算
- `and rd, rs1, rs2` - 論理積
- `or rd, rs1, rs2` - 論理和
- `xor rd, rs1, rs2` - 排他的論理和
- `sll rd, rs1, rs2` - 論理左シフト
- `srl rd, rs1, rs2` - 論理右シフト
- `sra rd, rs1, rs2` - 算術右シフト
- `slt rd, rs1, rs2` - 符号付き比較
- `sltu rd, rs1, rs2` - 符号なし比較

#### I型命令（即値演算）
- `addi rd, rs1, imm` - 即値加算
- `slti rd, rs1, imm` - 符号付き即値比較
- `sltiu rd, rs1, imm` - 符号なし即値比較
- `xori rd, rs1, imm` - 即値排他的論理和
- `ori rd, rs1, imm` - 即値論理和
- `andi rd, rs1, imm` - 即値論理積
- `slli rd, rs1, shamt` - 即値論理左シフト
- `srli rd, rs1, shamt` - 即値論理右シフト
- `srai rd, rs1, shamt` - 即値算術右シフト

#### ロード命令
- `lb rd, offset(rs1)` - バイトロード（符号拡張）
- `lw rd, offset(rs1)` - ワードロード

#### ストア命令
- `sb rs2, offset(rs1)` - バイトストア
- `sw rs2, offset(rs1)` - ワードストア

#### 分岐命令
- `beq rs1, rs2, label` - 等しければ分岐
- `bne rs1, rs2, label` - 等しくなければ分岐
- `blt rs1, rs2, label` - 符号付き比較で小さければ分岐
- `bge rs1, rs2, label` - 符号付き比較で以上なら分岐
- `bltu rs1, rs2, label` - 符号なし比較で小さければ分岐
- `bgeu rs1, rs2, label` - 符号なし比較で以上なら分岐

#### ジャンプ命令
- `jal rd, label` - ジャンプ・アンド・リンク
- `jalr rd, rs1, offset` - レジスタ間接ジャンプ・アンド・リンク

#### U型命令
- `lui rd, imm` - 上位即値ロード
- `auipc rd, imm` - PC相対上位即値加算

### 浮動小数点演算 (F拡張 - 単精度)
#### 独自ロード命令
- `la rd, label` - 疑似命令。アセンブラが `lui`/`addi` に展開するため、シミュレータでも追加実装なしで利用できます。

#### 算術演算命令
- `fadd fd, fs1, fs2` - 浮動小数点加算
- `fsub fd, fs1, fs2` - 浮動小数点減算
- `fmul fd, fs1, fs2` - 浮動小数点乗算
- `fdiv fd, fs1, fs2` - 浮動小数点除算
- `fsqrt fd, fs1` - 浮動小数点平方根

#### 符号操作命令
- `fneg fd, fs1` - 符号反転
- `fabs fd, fs1` - 絶対値

#### 比較命令
- `feq rd, fs1, fs2` - 等値比較（整数レジスタに0/1を格納）
- `flt rd, fs1, fs2` - 小なり比較（整数レジスタに0/1を格納）
- `fle rd, fs1, fs2` - 以下比較（整数レジスタに0/1を格納）

#### ロード/ストア命令
- `flw fd, offset(rs1)` - 浮動小数点ワードロード
- `fsw fs2, offset(rs1)` - 浮動小数点ワードストア

### カスタム拡張命令
#### M拡張（乗除算）
- `mul rd, rs1, rs2` - 乗算（下位32ビット）
- `div rd, rs1, rs2` - 符号付き除算

#### カスタム浮動小数点命令
- `fisqrt fd, fs1` - 逆数平方根（1/√x）
- `finv fd, fs1` - 逆数（1/x）
- `floor rd, fs1` - 床関数（浮動小数点→整数レジスタ）
- `ftoi rd, fs1` - 浮動小数点→整数変換（整数レジスタへ）
- `itof fd, rs1` - 整数→浮動小数点変換（整数レジスタから）

#### システム命令
- `ebreak` - ブレークポイント（実行停止）

### MMIO（Memory-Mapped I/O）
- アドレス `0xffff0000` への `sb` 命令で文字出力（標準エラー出力）

## 使用方法
このシミュレータは通常、上位の `run_simulator.py` または `run_debugger.py` を通じて使用されます。

### 基本的な実行

```bash
# アセンブリファイルを実行
python simulator/run_simulator.py program.s

# デバッグモードで実行
python simulator/run_simulator.py program.s --debug
```

### デバッガで実行

```bash
# インタラクティブデバッガ
python simulator/run_debugger.py program.s

# ステップモード
python simulator/run_debugger.py program.s --step
```

### レジスタ初期値
`simulator/simulator/config.yaml` 内に`x<番号>: 値` を書くと、シミュレータ起動時の整数レジスタ初期値として読み込まれます（例: `x2` でスタックポインタ）。`x0` はハードワイヤード 0 のまま無視されます。