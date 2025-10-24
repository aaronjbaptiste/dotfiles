#!/bin/bash

echo "[Start] Installing apps with npm"

# Activate proto to make npm available
if [ -f "$HOME/.proto/shims/npm" ]; then
  export PATH="$HOME/.proto/shims:$PATH"
fi

npm install -g @anthropic-ai/claude-code
npm install -g @openai/codex

echo "[Done] Installing apps with npm"
