#!/usr/bin/env bash

shopt -s globstar nullglob

echo 'finding files'
find . -name '*cache'

files=(./**/*cache)
len=${#files[@]}

echo "found $len files"
