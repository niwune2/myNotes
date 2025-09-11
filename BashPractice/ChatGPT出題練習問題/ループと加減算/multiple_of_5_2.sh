#!/bin/bash

sum=0

for i in {1..20}; do
	if [[ $((i%5)) -eq 0 && $((i%2)) -eq 0 ]]; then
		sum=$((sum+i))
	fi
done

echo "$sum"
