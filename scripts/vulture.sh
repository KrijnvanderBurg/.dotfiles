#!/bin/bash
target_path="${1:-$PWD}" && echo "Scanning folder: $target_path" 
config_filepath="${2}" && echo "Config file: $config_filepath"

pip install vulture --quiet
echo -n "Vulture version: " && vulture --version

vulture "$target_path" \
  --config "$config_filepath"
