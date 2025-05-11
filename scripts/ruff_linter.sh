#!/bin/bash
target_path="${1:-$PWD}" && echo "Scanning folder: $target_path"
config_filepath="${2}" && echo "Config file: $config_filepath"

pip install ruff --quiet
echo -n "ruff version: " && ruff --version

ruff check "$target_path" \
  --config "$config_filepath" \
  --no-fix \
  --diff \
  --show-files
