#!/bin/bash
target_path="${1:-$PWD}" && echo "Scanning folder: $target_path"
config_filepath="${2}" && echo "Config file: $config_filepath"

pip install pylint --quiet
echo -n "pylint version: " && pylint --version

pylint "$target_path" \
  --rcfile "$config_filepath" \
  --recursive y
