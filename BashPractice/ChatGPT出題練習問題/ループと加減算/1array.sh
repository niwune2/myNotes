#!/bin/bash
# 要素を直接ループする

nums=(2 5 8 13 21)

for n in "${nums[@]}"; do
	echo "要素 $n"
done

