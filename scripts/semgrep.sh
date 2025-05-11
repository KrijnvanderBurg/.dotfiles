#!/bin/bash
target_path="${1:-$PWD}" && echo "Scanning folder: $target_path"
config_filepath="${2}" && echo "Config file: $config_filepath"
output_filepath="${3:-$PWD/semgrep-junit.xml}" && echo "Output will be saved to: $output_filepath"

pip install semgrep --quiet

semgrep scan "$target_path" \
  --config "p/default" \
  --config "p/python" \
  --config "$config_filepath" \
  --junit-xml \
  -o "$output_filepath" \
  --strict \
  --error \
  --text \
  --no-autofix \
  --force-color \
  --metrics "off" \
  --oss-only
exit_code=$?

exit $exit_code
