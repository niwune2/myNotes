#!/bin/bash

fileName="gen_random_logs.sh"
directory="logs"

if [ ! -f "$fileName" ]; then
    echo "$fileName を作成します"
    touch "$fileName"
else
    echo "ファイルは既に存在します"
fi

if [ ! -d "$directory" ]; then
    echo "$directory が存在しないため作成します"
    mkdir -p "$directory"
fi

if [ -f "$fileName" ]; then
    echo "$fileName を $directory に移します"
    mv "$fileName" "$directory/"
else
    echo "$fileName がありません"
fi



