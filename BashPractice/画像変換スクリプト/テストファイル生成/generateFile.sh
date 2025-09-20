#!/bin/bash

quant=$1

# ダメコード
# for i in $quant; do
# 	touch "$quant"_"$i".txt
# done

for ((i=1; i<quant; i++)); do
	touch "${quant}_${i}.txt"
done

