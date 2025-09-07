#!/bin/bash

count=10

for i in {1..5}; do
	count=$((count-2))
	echo "残り：$count"
done
