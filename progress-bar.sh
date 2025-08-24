#!/usr/bin/env bash

progress-bar() {
  local current=$1
  local len=$2

  local bar_char='|'
  local empty_char=' '
  #set limit length of columns terminal
  local length=50
  local perc_done=$((current * 100 / len))
  local num_bars=$((perc_done * length / 100))

  local i
  local s='['
  for ((i = 0; i < num_bars; i++)); do
    s+=$bar_char
  done
  for ((i = num_bars; i < length; i++)); do
    s+=$empty_char
  done
  s+=']'

  echo -ne "$s $current/$len ($perc_done%)\r"
}

process-file() {
  local file=$1

  sleep .01
}

shopt -s globstar nullglob

echo 'finding files'

files=(./**/*cache)
len=${#files[@]}

i=0
echo "found $len files"

for file in "${files[@]}"; do
  progress-bar "$((i + 1))" "$len"
  process-file "$file"
  ((i++))
done

echo
