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

process-files() {
  local files=("$@")

  sleep .01
}

shopt -s globstar nullglob

echo 'finding files'
files=(./**/*cache)
len=${#files[@]}
echo "found $len files"

batchsize=5
for ((i = 0; i < len; i += batchsize)); do
  progress-bar "$((i + 1))" "$len"
  process-files "${files[@]:i:batchsize}"
done

progress-bar "$len" "$len"

echo
