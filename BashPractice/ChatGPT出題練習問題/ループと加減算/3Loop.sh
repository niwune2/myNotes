#!/bin/bash

count=0

for i in {1..5};do
	if [ $(( i % 2 )) -eq 0 ]; then
		count=$(( count + 1 ))
	fi
done

echo "最終的な count = $count"

