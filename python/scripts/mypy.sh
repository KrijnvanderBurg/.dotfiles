#!/bin/bash
target_path="${1:-$PWD}" && echo "Scanning folder: $target_path"
config_filepath="${2}" && echo "Config file: $config_filepath"

# Install mypy if not already installed
if ! command -v mypy &> /dev/null; then
    echo "Installing mypy..."
    pip install mypy --quiet
fi
echo -n "mypy version: " && mypy --version

mypy "$target_path" \
  --config-file "$config_filepath"
