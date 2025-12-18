@echo off
setlocal
REM Usage: run_server.bat [sim|prod] [COMx] [baud]
REM Defaults: sim COM4 9600

set MODE=%1
if "%MODE%"=="" set MODE=sim

set COMPORT=%2
if "%COMPORT%"=="" set COMPORT=COM4

set BAUD=%3
if "%BAUD%"=="" set BAUD=9600

REM Resolve repo root (folder of this script)
set ROOT=%~dp0
if "%ROOT:~-1%"=="\" set ROOT=%ROOT:~0,-1%
set SERVER=%ROOT%\cpuex-v1.6\server

pushd "%SERVER%"
if not exist out mkdir out >nul 2>&1

if /I "%MODE%"=="sim" goto :SIM
if /I "%MODE%"=="prod" goto :PROD
echo Unknown mode "%MODE%". Use sim or prod.
popd
endlocal & exit /b 1

:SIM
echo [SIM] python server.py %COMPORT% --baudrate %BAUD% --raw_output 7
python server.py %COMPORT% --baudrate %BAUD% --raw_output 7 ^
  -p "%ROOT%\for_simulation\prog.bin" ^
  -d "%ROOT%\for_simulation\sld_test_1300.bin" ^
  -o .\out\run1
goto :END

:PROD
echo [PROD] python server.py %COMPORT% --baudrate %BAUD%
python server.py %COMPORT% --baudrate %BAUD% ^
  -p "%ROOT%\for_simulation\prog.bin" ^
  -d "..\raytracer\sld\contest.sld" ^
  -o .\out\run1
goto :END

:END
popd
endlocal

