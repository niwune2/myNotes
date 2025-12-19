#!/bin/bash

fileName="app.log"
count=100

if [ ! -f "$fileName" ]; then
    echo "$fileName が存在しないため作成します"
    touch "$fileName"
else
    echo "$fileName は存在します"
fi

for ((i=0; i < count; i++)); do
    x=$((RANDOM % 2))

    if (( $x == 0 )); then
        echo "ERROR" >> "$fileName"
    else
        echo "GOOD" >> "$fileName"
    fi
done

echo "合計 $((count + 1))行のログを生成しました。"
