#!/bin/bash

sum=0

for i in {1..5}; do
	#add=$i
	sum=$((i + sum))
	#echo "add = $add"
	echo "sum = $sum"
done

echo "合計 = $sum"
