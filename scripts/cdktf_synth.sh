#!/bin/bash
output_path="${1:-$PWD}" && echo "output folder: $output_path"

npm install --silent --global cdktf-cli@0.20
echo -n "cdktf version: " && cdktf --version

cdktf synth \
  --output "$output_path"
