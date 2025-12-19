#!/bin/bash

count=10
fileName="app.log"

if [ -f $fileName ]; then
	echo "ファイル $fileName を作成します。"
	touch $fileName
else
	echo "ファイル $fileName は存在します。"
fi

for (( i=1; i<=count; i++)); do
	rand=$((RANDOM % 2))

	if (( rand == 0 )); then
		echo "ERROR" >> "$fileName"
	else
		echo "GOOD" >> "$fileName"
	fi
done

