#!/bin/bash
target_path="${1:-$PWD}" && echo "Scanning folder: $target_path"
config_filepath="${2}" && echo "Config file: $config_filepath"

pip install isort --quiet
echo -n "isort version: " && isort --version

isort --check-only "$target_path" \
  --settings-path "$config_filepath" \
  --diff
