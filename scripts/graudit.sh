#!/bin/bash
target_path="${1:-$PWD}" && echo "Scanning folder: $target_path"

git clone https://github.com/wireghoul/graudit $HOME/.graudit/
echo "export PATH=$PATH:$HOME/.graudit" >> ~/.profile
source ~/.profile
echo -n "graudit version: " && graudit -v

graudit -d python -A "$target_path"
