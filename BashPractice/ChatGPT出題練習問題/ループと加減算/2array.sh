#!/bin/bash
#インデックスをループする


nums=(2 3 5 8 13 21)

for i in "${!nums[@]}"; do
	echo "インデックス：$i → 値:${nums[i]}"
done

