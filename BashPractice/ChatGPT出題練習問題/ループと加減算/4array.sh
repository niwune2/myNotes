#!/bin/bash

# "インデックスが"奇数番目の要素を取り出す

nums=(2 5 8 13 21)

sum=0

for i in "${!nums[@]}"; do
	if [ $((i%2)) != 0 ]; then
		sum=$((sum+nums[i]))
	fi
done

echo "合計は$sum"

