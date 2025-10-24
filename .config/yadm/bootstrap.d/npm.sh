#!/bin/bash

echo "[Start] Installing apps with npm"

# Activate proto environment
eval "$(proto activate bash)"

npm install -g @anthropic-ai/claude-code
npm install -g @openai/codex

echo "[Done] Installing apps with npm"
