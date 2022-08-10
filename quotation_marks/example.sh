#!/bin/bash

echo "stdout by echo:"
echo 'Here is the path to my \$HOME $HOME'
echo "Here is the path to my \$HOME $HOME"
echo "Here is the path to my \$HOME "$HOME""
echo


echo "stdout by printf:"
printf 'Here is the path to my \$HOME $HOME\n'
printf "Here is the path to my \$HOME $HOME\n"
printf "Here is the path to my \$HOME "$HOME"\n"

