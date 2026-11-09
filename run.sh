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
