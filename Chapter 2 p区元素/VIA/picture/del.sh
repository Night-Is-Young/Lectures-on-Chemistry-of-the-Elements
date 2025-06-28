#!/usr/bin/env bash

# 定位到脚本所在目录（即使从其他目录调用脚本）
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
for f in *.png; do [ -f "$f" ] && bmeps -c "$f" "${f%.png}.eps"; done
find "$script_dir" -type f -name "*.png" -exec rm -f {} +
find "$script_dir" -type f -name "*.pdf" -exec rm -f {} +