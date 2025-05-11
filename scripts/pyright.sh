#!/bin/bash
target_path="${1:-$PWD}" && echo "Scanning folder: $target_path"
config_filepath="${2}" && echo "Config file: $config_filepath"

pip install pyright --quiet
echo -n "pyright version: " && pyright --version

pyright "$target_path" \
  --project "$config_filepath" \
  --level warning \
  --warnings
