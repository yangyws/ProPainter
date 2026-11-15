#!/bin/zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

LAN_IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null || echo "localhost")
echo "=================================================="
echo " ProPainter 互動式網頁版啟動中..."
echo " Mac 本機網址:  http://127.0.0.1:7860"
echo " iPad 區網網址: http://${LAN_IP}:7860"
echo "=================================================="

GRADIO_SERVER_NAME=0.0.0.0 PYTORCH_ENABLE_MPS_FALLBACK=1 "$SCRIPT_DIR/.venv/bin/python" \
  "$SCRIPT_DIR/web-demos/hugging_face/app.py" \
  --port 7860
