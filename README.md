# Portable AI 

An offline AI coding assistant that runs from a flash disk. No installation, no internet needed once set up. Designed to work on ordinary computers with **8 GB of RAM**. Works on Windows, Mac, and Linux.

> This project is a launcher plus instructions. The AI program and model are large, so you download them separately (steps below).

## Features

- Runs from a USB flash disk, nothing installed on the host computer
- Works fully offline after setup
- Coding-focused model that fits on 8 GB RAM computers
- Free and open source tools
- Chat interface opens in your web browser

## Requirements

- **RAM:** 8 GB minimum. More RAM lets you use a bigger, smarter model.
- **Flash disk:** 8 GB works for the default small model. 16 GB or more is better if you want several models. USB 3.0 recommended (USB 2.0 works but loads slowly).
- **OS:** Windows, macOS, or Linux
- The AI runs on the computer's processor, not on the flash disk.
- Close big programs (browser tabs, games) before starting so the model has memory to use.

## Quick Start

### Step 1: Make a folder
Create a folder on your flash disk, for example `portable-ai`. Put `run.bat` and `run.sh` (from this project) inside it.

### Step 2: Download the llamafile program
Go to https://github.com/mozilla-ai/llamafile/releases and download the file named **`llamafile-<version>`** (for example `llamafile-0.10.6`, about 350 MB). Do not pick the `-thin`, `.zip`, `diffusionfile`, `whisperfile`, `transcribefile`, or `zipalign` files.

Save it in your folder and rename it:

- **Windows:** `llamafile.exe` (turn on "File name extensions" in File Explorer so you don't create `llamafile.exe.txt`)
- **Mac/Linux:** `llamafile`

### Step 3: Download a model
Download a coding model in **GGUF** format from https://huggingface.co and save it in your folder as `model.gguf`. Pick the size by your computer's RAM, and choose a **Q4_K_M** file:

| Computer RAM | Recommended model | Approx. file size |
|--------------|-------------------|-------------------|
| 4 to 6 GB | Qwen2.5-Coder **1.5B** | about 1 GB |
| **8 GB (default)** | Qwen2.5-Coder **3B** | about 2 GB |
| 16 GB | Qwen2.5-Coder **7B** | about 4.5 GB |
| 32 GB+ | Larger models such as Qwen3-Coder 30B | 18 GB+ |

Search for "Qwen2.5-Coder 3B Instruct GGUF". Choose the **Instruct** version, not the base version. A 7B model on an 8 GB computer is borderline and may crash or run very slowly.

### Step 4: Run it
- **Windows:** double-click `run.bat`
- **Mac/Linux:** in a terminal, run `chmod +x run.sh` then `./run.sh`

Your browser opens (or go to http://localhost:8080) and you can start chatting.

Your folder should look like this:

```
portable-ai/
├── run.bat
├── run.sh
├── llamafile (or llamafile.exe)
└── model.gguf
```

## What it can and can't do

Good for: short functions, explaining code, fixing simple bugs, basic scripts, learning to code.

Limits: small models are less capable than online assistants. They can make mistakes or invent functions that don't exist. Ask for small, specific things, and **always test code before relying on it.**

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Antivirus warning on Windows | Llamafile is sometimes flagged falsely. Download only from the official release page, then allow it. |
| Very slow to start | Normal on USB 2.0 flash disks. The model is loading into RAM. |
| Crash or "out of memory" | Use a smaller model (1.5B) and close other programs. |
| Very slow replies | Your model is too big for your RAM. Try a smaller one. |
| Mac says "cannot verify developer" | Right-click the file > Open, or allow it in System Settings > Privacy & Security. |
| `Permission denied` on Mac/Linux | Run `chmod +x run.sh llamafile` |
| Blocked on school/work computers | Those computers may not allow running programs from USB. |
| Page won't open | Another program may be using port 8080. Change `8080` in the launcher. |
| Option not recognized | Llamafile options change between versions. Check the release notes. |

## Launcher scripts

**`run.bat` (Windows)**

```bat
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
```

**`run.sh` (Mac/Linux)**

```bash
#!/bin/bash
cd "$(dirname "$0")" || exit 1

if [ ! -f ./llamafile ]; then
  echo "Missing 'llamafile' program. See README Step 2."; exit 1
fi
if [ ! -f ./model.gguf ]; then
  echo "Missing 'model.gguf'. See README Step 3."; exit 1
fi

chmod +x ./llamafile
echo "Starting AI... open http://localhost:8080 in your browser."
echo "Press Ctrl+C to stop."
# -c 4096 keeps memory use low so it fits on 8 GB computers
./llamafile -m ./model.gguf --server --port 8080 -c 4096
```

## Credits

- [llamafile](https://github.com/mozilla-ai/llamafile) by Mozilla.ai
- [llama.cpp](https://github.com/ggerganov/llama.cpp)
- Model: Qwen2.5-Coder by Alibaba Cloud. Check the license on the Hugging Face page of the exact size you download, as it can differ between sizes.

## Disclaimer

AI output may be inaccurate or insecure. Review all generated code.

## Contributing

Issues and pull requests are welcome, especially tested model recommendations and fixes for different computers.

## License

The scripts and instructions in this project are under the MIT License (see `LICENSE`). The model and llamafile have their own licenses; read them before redistributing.
