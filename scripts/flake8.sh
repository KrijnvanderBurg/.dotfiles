#!/bin/bash
target_path="${1:-$PWD}" && echo "Scanning folder: $target_path"
config_filepath="${2}" && echo "Config file: $config_filepath"

pip install flake8 --quiet
echo -n "flake8 version: " && flake8 --version

flake8 "$target_path" \
  --config "$config_filepath"
