param(
    # UART ボーレート（server.py に渡す）
    [int]$Baudrate = 115200,
    [int]$RawOutputBytes = 1
)

# ============================================================
# ★★ パス設定 ★★
# ============================================================

$ProgramBinPath = "C:\CPUExperiment\simulation\data\hexbin\minrt-512.bin"

$sldPath = "C:\CPUExperiment\cpuex-v1.6\raytracer\sld\contest_largened.bin"

$ServerScriptPath = "C:\CPUExperiment\cpuex-v1.6\server\server.py"

$ComPort = "COM3"

$OutputBinPath = "C:\CPUExperiment\simulation\out\output"

# ============================================================
# 仮想環境
# ============================================================

$userHome   = $env:USERPROFILE
$VenvScript = Join-Path $userHome ".venv\Scripts\Activate.ps1"
$PythonExe  = Join-Path $userHome ".venv\Scripts\python.exe"

# ============================================================
# 関数
# ============================================================

function Get-LineCount {
    param([string]$Path)
    if (-not (Test-Path $Path)) {
        throw "File not found: $Path"
    }
    return (Get-Content $Path | Measure-Object -Line).Lines
}

# ============================================================
# MAIN
# ============================================================

Write-Host "=== Send for real machine (easy program) ==="

# ------------------------------------------------------------
# 仮想環境起動
# ------------------------------------------------------------
if (-not (Test-Path $VenvScript)) {
    throw "venv not found: $VenvScript"
}
Write-Host "Activating venv: $VenvScript"
. $VenvScript

if (-not (Test-Path $PythonExe)) {
    throw "python missing in venv: $PythonExe"
}
Write-Host "Using python exe: $PythonExe"
& $PythonExe -c "import sys; print('DEBUG python:', sys.executable)"

# ------------------------------------------------------------
# SLD size (バイト)
# ------------------------------------------------------------
if (-not (Test-Path $sldPath)) {
    throw "SLD file not found: $sldPath"
}
$SLD_SIZE_BYTES = (Get-Item $sldPath).Length

Write-Host "SLD file : $sldPath"
Write-Host "SLD size : $SLD_SIZE_BYTES bytes"

Write-Host "=============================================="
Write-Host "  BIN  : $ProgramBinPath"
Write-Host "  SLD  : $sldPath"
Write-Host "  PORT : $ComPort"
Write-Host "  BAUD : $Baudrate"
Write-Host "  OUT  : $OutputBinPath.[bin|ppm|png]"
Write-Host "=============================================="

# ------------------------------------------------------------
# server.py 実行（実機に BIN + SLD を送信 & 画像受信）
# ------------------------------------------------------------

if (-not (Test-Path $ServerScriptPath)) {
    throw "server.py not found: $ServerScriptPath"
}

Write-Host "Running server.py to send program & SLD to board..."

& $PythonExe $ServerScriptPath `
    $ComPort `
    --baudrate $Baudrate `
    -p $ProgramBinPath `
    -d $sldPath `
    -o $OutputBinPath `
    --raw_output $RawOutputBytes

if ($LASTEXITCODE -ne 0) {
    throw "server.py failed"
}

Write-Host "=== Done: BIN assembled & sent, output saved ==="

# server.py が生成するバイナリのパス

if (Test-Path $OutputBinPath) {
    Write-Host ""
    Write-Host "=== Received .bin ==="
    Write-Host "  $OutputBinPath"
    Write-Host ""

    # HEX 表示は行わない
    # Format-Hex $OutputBinPath

} else {

    Write-Host ""
    Write-Host "=== (NOTE) No output found ==="
    Write-Host "Expected: $FibBinPath"
    Write-Host ""

}

# ------------------------------------------------------------
# 生バイナリ (output.bin 相当) → 画像 (PPM) に変換
#   想定：FPGA 側が PPM (P6/P5) フォーマットをそのまま送っている
# ------------------------------------------------------------

if (-not (Test-Path $OutputBinPath)) {
    Write-Warning "Raw output file not found: $OutputBinPath"
} else {
    Write-Host "Converting raw output to image..."

    $bytes = [System.IO.File]::ReadAllBytes($OutputBinPath)
    Write-Host "Raw output size = $($bytes.Length) bytes"

    if ($bytes.Length -ge 2 -and
        $bytes[0] -eq 0x50 -and # 'P'
        ($bytes[1] -eq 0x36 -or $bytes[1] -eq 0x35) # '6' or '5'
    ) {
        # 'P6' or 'P5' : PPM/PGM とみなす
        $ppmPath = $OutputBinPath + ".ppm"
        [System.IO.File]::WriteAllBytes($ppmPath, $bytes)
        Write-Host "Detected PPM/PGM header in raw output. Saved as image file: $ppmPath"
        Write-Host "You can open it with an image viewer supporting PPM."
    } else {
        Write-Warning "Raw output is not recognized as PPM/PGM (no 'P6'/'P5' header). Left as binary only."
    }
}

Write-Host "=== Done: existing BIN sent, raw-output → image (if PPM) ==="