#!/bin/bash
target_path="${1:-$PWD}" && echo "Scanning folder: $target_path"
config_filepath="${2}" && echo "Config file: $config_filepath"

pip install black --quiet
echo -n "black version: " && black --version

black "$target_path" \
  --config "$config_filepath" \
  --check \
  --diff \
  --color \
  --verbose
