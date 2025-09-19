#!/bin/bash

sum=0
even=0
odd=0

for i in {1..100}; do
	if [ $((i%2)) -eq 0 ]; then
            even=$((even+i))
        else
            odd=$((odd+i))
        fi
	sum=$((sum+i))
done

echo "合計：$sum"
echo "合計：$even"
echo "合計：$odd"

