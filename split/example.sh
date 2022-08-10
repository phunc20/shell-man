#!/bin/bash

filepath="/home/phunc20/downloads/rm-18.txt"
parent=$(dirname -- "$filepath")
filename=$(basename -- "$filepath")
stem="${filename%.*}"
extension="${filename##*.}"
part_num="${stem##*-}"

echo "filepath = \"$filepath\""
echo "parent = \"$parent\""
echo "filename = \"$filename\""
echo "stem = \"$stem\""
echo "extension = \"$extension\""
echo "part_num = \"$part_num\""
