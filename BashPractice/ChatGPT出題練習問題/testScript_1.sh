#!/bin/bash

touch text_{1..3}.txt

for i in *.txt; do
	echo "$i"
done

