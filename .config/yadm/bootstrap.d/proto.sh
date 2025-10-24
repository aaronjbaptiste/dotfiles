#!/bin/bash

echo "[Start] Installing apps with proto"

proto install node
proto install bun
proto install moon

# Activate proto environment
eval "$(proto activate bash)"

echo "[Done] Installing apps with proto"
