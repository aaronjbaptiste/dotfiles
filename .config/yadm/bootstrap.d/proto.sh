#!/bin/bash

if [ "$(yadm config --get local.class)" = "work" ]; then
  echo "[Skip] proto installs (work machine)"
  exit 0
fi

echo "[Start] Installing apps with proto"

proto install node
proto install bun
proto install moon

# Activate proto environment
eval "$(proto activate bash)"

echo "[Done] Installing apps with proto"
