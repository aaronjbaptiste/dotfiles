#!/bin/bash

echo "[Start] Installing apps with npm"

# Activate proto to make npm available
export PATH="$HOME/.proto/shims:$HOME/.proto/bin:$PATH"

# Use proto to ensure npm is available
proto use node

npm install -g @anthropic-ai/claude-code
npm install -g @openai/codex

echo "[Done] Installing apps with npm"
