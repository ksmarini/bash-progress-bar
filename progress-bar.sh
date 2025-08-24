#!/usr/bin/env bash

progress-bar() {
  local current=$1
  local len=$2

  local perc_done=$((current * 100 / len))

  echo "processing $current/$len ($perc_done%)"

  local i
  local s='['
  for ((i = 0; i < perc_done; i++)); do
    s+='|'
  done
  for ((i = perc_done; i < 100; i++)); do
    s+=' '
  done
  s+=']'

  echo "$s"
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
