#!/bin/bash
target_dirpath="${1:-$PWD}" && echo "Target dirpath: $target_dirpath"
config_filepath="${2}" && echo "Config filepath: $config_filepath"

pip install poetry --quiet
poetry self add poetry-plugin-export

# https://github.com/python-poetry/poetry-plugin-export
poetry export --format requirements.txt \
  --all-extras \
  --all-groups \
  --without-hashes \
  | tee "$target_dirpath/requirements.txt"

pip install ossaudit --quiet
echo "ossaudit has no option to print version."

ossaudit -f "$target_dirpath/requirements.txt" \
  --config "$config_filepath"
