#!/bin/bash

file="app.log"

errorCount=$(grep -c "ERROR" "$file")
totalCount=$(wc -l < "$file")

if (( totalCount == 0 )); then
    echo "NO LOG"
    exit 1
fi

percent=$(( errorCount * 100 / totalCount ))

if (( percent >= 50 )); then
    echo "HIGH ERROR"
else
    echo "NORMAL"
fi

echo "${percent}%"
