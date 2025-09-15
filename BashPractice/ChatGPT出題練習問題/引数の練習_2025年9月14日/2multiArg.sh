#!/bin/bash

sum=0

for i in "$@"; do
	num=$@
	sum=$((sum+num))
done

echo "合計は$sum"
