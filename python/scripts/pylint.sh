#!/bin/bash
target_path="${1:-$PWD}" && echo "Scanning folder: $target_path"
config_filepath="${2}" && echo "Config file: $config_filepath"

# Install pylint if not already installed
if ! command -v pylint &> /dev/null; then
    echo "Installing pylint..."
    pip install pylint --quiet
fi
echo -n "pylint version: " && pylint --version

pylint "$target_path" \
  --rcfile "$config_filepath" \
  --recursive y
