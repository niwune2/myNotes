#!/bin/bash

number=0

for i in {1..10}; do
	echo "number is $((number))"
	number=$((number+1))
done
