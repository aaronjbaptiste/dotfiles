#!/bin/bash

echo "[Start] Installing apps with npm"

npm install -g @olrtg/emmet-language-server

if [ "$(yadm config --get local.class)" != "work" ]; then
  npm install -g @anthropic-ai/claude-code
  npm install -g @openai/codex
fi

echo "[Done] Installing apps with npm"
