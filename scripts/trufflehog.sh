#!/bin/bash
target_path="${1:-$PWD}" && echo "Scanning folder: $target_path"  # Default to current directory if not specified
config_filepath="${2}" && echo "Config file: $config_filepath"  # Config file path

curl -sSfL https://raw.githubusercontent.com/trufflesecurity/trufflehog/main/scripts/install.sh | sh -s -- -b $HOME/.local/bin
echo -n "TruffleHog version: " && trufflehog --version

# Scanning the target folder with TruffleHog
trufflehog git "$target_path" \
  --config "$config_filepath" \
  --no-update \
  --include-detectors="all" \
  --only-verified \
  --fail
