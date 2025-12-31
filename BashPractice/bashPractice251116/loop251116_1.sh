#!/bin/bash

for i in {1..5}; do
	touch ${i}_test.txt
	echo "$i"
done

