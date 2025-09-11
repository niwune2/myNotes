#!/bin/bash

nums=(2 5 8 13 21)

length=${#nums[@]}

sum=0

for i in ${length[i]}; do
	arrayElem=${length[$i]}
	sum=$((sum+arrayElem))

done

echo "$sum"
