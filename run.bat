@echo off
cd /d "%~dp0"

if not exist llamafile.exe (
  echo Missing llamafile.exe. See README Step 2.
  pause
  exit /b 1
)
if not exist model.gguf (
  echo Missing model.gguf. See README Step 3.
  pause
  exit /b 1
)

echo Starting AI... open http://localhost:8080 in your browser.
echo Close this window to stop.
start "" http://localhost:8080
rem -c 4096 keeps memory use low so it fits on 8 GB computers
llamafile.exe -m model.gguf --server --port 8080 -c 4096
pause
