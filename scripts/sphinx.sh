#!/bin/bash
docs_dirpath="${1:-$PWD/docs}" && echo "Set CWD to: $docs_dirpath"

pip install sphinx --quiet
pip install sphinx-autoapi sphinx-rtd-theme --quiet

cd $docs_dirpath

make html
