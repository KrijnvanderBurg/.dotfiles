#!/bin/bash
target_path="${1:-$PWD}" && echo "Scanning folder: $target_path"
config_filepath="${2}" && echo "Config file: $config_filepath"

dotnet tool install --global Microsoft.CST.devskim.CLI
echo -n "devskim version: " && devskim --version

devskim analyze --source-code "$target_path" \
  --options-json "$config_filepath" \
  -E