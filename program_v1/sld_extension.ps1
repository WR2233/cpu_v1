param(
    [Parameter(Mandatory)]
    [string]$InputSldPath = "C:\CPUExperiment\cpuex-v1.6\raytracer\sld\contest.sld",

    [Parameter(Mandatory)]
    [int]$TargetSizeBytes = 1240
)

# ===== 入力チェック =====

if (-not (Test-Path $InputSldPath)) {
    throw "Input SLD file not found: $InputSldPath"
}

if ($TargetSizeBytes -le 0) {
    throw "TargetSizeBytes must be positive. Given: $TargetSizeBytes"
}

# ===== 元ファイル読み込み =====

$bytes    = [System.IO.File]::ReadAllBytes($InputSldPath)
$origSize = $bytes.Length

if ($origSize -gt $TargetSizeBytes) {
    throw "Original SLD is larger than target size. orig=$origSize, target=$TargetSizeBytes"
}

# ===== 出力パス決定 (xxx.sld → xxx_largened.bin) =====

$dir  = Split-Path $InputSldPath -Parent
$base = [System.IO.Path]::GetFileNameWithoutExtension($InputSldPath)
$outPath = Join-Path $dir ($base + "_largened.bin")

# ===== 0 埋めして bin を作る =====

# 目標サイズぶんのバッファを作る（初期値は 0x00）
$outBuf = New-Object byte[] $TargetSizeBytes
# 先頭に元データをコピー
[System.Array]::Copy($bytes, 0, $outBuf, 0, $origSize)

# 書き込み
[System.IO.File]::WriteAllBytes($outPath, $outBuf)

Write-Host "Input SLD : $InputSldPath (size = $origSize bytes)"
Write-Host "Output BIN: $outPath     (size = $TargetSizeBytes bytes)"

# 呼び出し側でキャッチしやすいように、最後にパスだけ素直に返す
Write-Output $outPath
