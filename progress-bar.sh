#!/usr/bin/env bash

progress-bar() {
  local i=$1
  local len=$2

  echo "processing $i/$len"
}

shopt -s globstar nullglob

echo 'finding files'
find . -name '*cache'

files=(./**/*cache)
len=${#files[@]}

i=0
echo "found $len files"

for file in "${files[@]}"; do
  progress-bar "$((i + 1))" "$len"
  ((i++))
done
