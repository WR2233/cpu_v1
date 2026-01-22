# Pipeline Processor Simulator

C++で実装したMIPS風5段パイプラインプロセッサシミュレータです。

## 特徴

- **5段パイプライン**: IF (Instruction Fetch), ID (Instruction Decode), EX (Execute), MEM (Memory Access), WB (Write Back)
- **ハザード検出**: Load-Useハザードを検出し、自動的にストールを挿入
- **データフォワーディング**: EX/MEMおよびMEM/WBステージからのフォワーディングに対応
- **分岐処理**: 分岐命令実行時にパイプラインをフラッシュ
- **統計情報**: サイクル数、実行命令数、CPI、ストール回数などを表示

## サポートする命令

### R-Type命令 (opcode = 0x00)
- `ADD rd, rs, rt` (funct = 0x20): rd = rs + rt
- `SUB rd, rs, rt` (funct = 0x22): rd = rs - rt
- `AND rd, rs, rt` (funct = 0x24): rd = rs & rt
- `OR rd, rs, rt` (funct = 0x25): rd = rs | rt
- `SLT rd, rs, rt` (funct = 0x2A): rd = (rs < rt) ? 1 : 0

### I-Type命令
- `ADDI rt, rs, imm` (opcode = 0x08): rt = rs + imm
- `LW rt, imm(rs)` (opcode = 0x23): rt = MEM[rs + imm]
- `SW rt, imm(rs)` (opcode = 0x2B): MEM[rs + imm] = rt
- `BEQ rs, rt, offset` (opcode = 0x04): if (rs == rt) PC = PC + 4 + (offset << 2)
- `BNE rs, rt, offset` (opcode = 0x05): if (rs != rt) PC = PC + 4 + (offset << 2)

### J-Type命令
- `J target` (opcode = 0x02): PC = (PC & 0xF0000000) | (target << 2)
- `JAL target` (opcode = 0x03): R31 = PC + 4, PC = (PC & 0xF0000000) | (target << 2)

## ビルド方法

```bash
make
```

## 使用方法

### 基本実行
```bash
./pipeline_sim <機械語ファイル>
```

### ステップ実行モード
```bash
./pipeline_sim -s <機械語ファイル>
```

### 詳細出力モード
```bash
./pipeline_sim -v <機械語ファイル>
```

### オプションの組み合わせ
```bash
./pipeline_sim -s -v test.mc
```

### デバッガモード
```bash
./pipeline_sim -d program.mc
```

- `-d`/`--debug`でインタラクティブデバッガを起動できます。
- コマンド例:
  - `step`/`s`: 1サイクル実行
  - `continue`/`c`: ブレークポイントまで実行
  - `break 0x00000020`: PCアドレスでブレークポイント設定
  - `regs`: 汎用レジスタ表示 (x0-x31)
  - `info`: PC・命令・レジスタ読み出し・ALU結果などのスナップショット表示
  - `bus`: 命令/データ/小数ROMバスのアドレス・データの可視化
  - `mem <addr> [count]`: メモリダンプ
  - `stats`: CPI等の統計表示

各サイクルで以下の情報を取得できます（高前田先生資料準拠の抽象度）:
- x0〜x31の内容、プログラムカウンタ
- 命令メモリアクセス（アドレス/データ）
- デコード段のレジスタ読み出し結果
- ALU/MDU/FPU演算結果
- データメモリアクセス（アドレス/リード＆ライトデータ）
- 小数ROM（flwi向け）アクセス履歴

## 機械語ファイルフォーマット

- 1行に1つの32ビット命令を16進数で記述
- `#` または `//` で始まる行はコメント
- `0x` プレフィックスは任意

例 (test.mc):
```
# 基本的な算術演算
20020005  # ADDI R2, R0, 5
20030003  # ADDI R3, R0, 3
00430820  # ADD R1, R2, R3
```

## 機械語フォーマット

### R-Type (32ビット)
```
[31-26: opcode] [25-21: rs] [20-16: rt] [15-11: rd] [10-6: shamt] [5-0: funct]
```

### I-Type (32ビット)
```
[31-26: opcode] [25-21: rs] [20-16: rt] [15-0: immediate]
```

### J-Type (32ビット)
```
[31-26: opcode] [25-0: address]
```

## 実行例

```bash
$ make
$ ./pipeline_sim test.mc

Loading program from: test.mc
Loaded 17 instructions

=== Starting Simulation ===

=== Simulation Complete ===

=== Registers ===
R 0:          0  R 1:          8  R 2:          0  R 3:          3
R 4:          3  R 5:          5  R 6:          0  R 7:          0
R 8:          5  R 9:          5  R10:          5  R11:          0
...

=== Execution Statistics ===
Total Cycles: 25
Instructions Executed: 17
Stalls: 1
Flushes: 0
CPI: 1.47059
```

## アーキテクチャの詳細

### パイプラインステージ
1. **IF (Instruction Fetch)**: 命令メモリから命令をフェッチ
2. **ID (Instruction Decode)**: 命令をデコードし、レジスタを読み出し
3. **EX (Execute)**: ALU演算または分岐判定を実行
4. **MEM (Memory Access)**: メモリの読み書き
5. **WB (Write Back)**: レジスタへの書き戻し

### ハザード対策
- **データフォワーディング**: EX/MEM, MEM/WBからIDステージへフォワーディング
- **Load-Useストール**: LW命令直後に依存する命令がある場合、1サイクルストール
- **制御ハザード**: 分岐命令実行時にパイプラインをフラッシュ

## 拡張可能性

以下の機能を追加することができます:

1. 分岐予測機構
2. より多くの命令セット (シフト命令、乗算・除算など)
3. 複数の実行ユニット (スーパースカラー)
4. キャッシュシミュレーション
5. 例外処理機構

## ライセンス

このコードは教育目的で自由に使用できます。
