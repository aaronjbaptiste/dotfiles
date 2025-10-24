#!/bin/bash

echo "[Start] Setup fish"

FISH_PATH="$(command -v fish)"

if [ -z "$FISH_PATH" ]; then
  echo "Fish not found, skipping fish setup"
  echo "[Done] Setup fish"
  exit 0
fi

if ! grep -qxF "$FISH_PATH" /etc/shells; then
  echo "$FISH_PATH" | sudo tee -a /etc/shells >/dev/null
fi

# Set fish as default shell
chsh -s "$FISH_PATH"

# Install fisher
fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source; and fisher install jorgebucaran/fisher'

# Install z plugin
fish -c 'fisher install jethrokuan/z'

echo "[Done] Setup fish"
