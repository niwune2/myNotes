#!/bin/bash

#合計を求める（要素ループ）

nums=(2 3 5 8 13 21)

sum=0

for n in "${nums[@]}"; do
	sum=$((sum+n))
done 

echo "合計=$sum"
