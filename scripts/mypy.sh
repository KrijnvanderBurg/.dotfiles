#!/bin/bash
target_path="${1:-$PWD}" && echo "Scanning folder: $target_path"
config_filepath="${2}" && echo "Config file: $config_filepath"

pip install mypy --quiet
echo -n "mypy version: " && mypy --version

mypy "$target_path" \
  --config-file "$config_filepath"
