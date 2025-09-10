#!/bin/bash

sum=0

for i in {1..20}; do
	if [ $((i%3)) -eq 0 ]; then
		sum=$((sum+i))
	fi
done

echo "合計値は $sum"
