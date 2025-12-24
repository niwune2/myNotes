#!/bin/bash

#count=$(grep -o "ERROR" app.log | wc -l)

errorCount=$(grep -c "ERROR" app.log)

totalCount=$(cat app.log|wc -l)

percent=$(( errorCount * 100 / totalCount ))

if (( $percent >= 50 )); then
    echo "HIGH ERROR"
else
    echo "NORMAL"
fi

echo "${percent}"
