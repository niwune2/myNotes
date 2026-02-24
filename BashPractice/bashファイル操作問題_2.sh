#!/bin/bash

fileName="app.log"
count=10

if [ ! -f "$fileName" ]; then
    echo "$fileName が存在しないため作成します"
    touch "$fileName"
else
    echo "$fileName は存在します（追記します）"
fi

# 1〜10 まで10行生成する場合
for ((i=1; i <= count; i++)); do
    x=$((RANDOM % 2))

    if (( x == 0 )); then
        echo "ERROR" >> "$fileName"
    else
        echo "GOOD" >> "$fileName"
    fi
done

echo "合計 $count 行のログを生成しました。"