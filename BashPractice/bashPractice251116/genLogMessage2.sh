#!/bin/bash

count=10

touch app.log

for ((i=1; i<count; i++)); do
	x=$((RANDOM % 2))
	if (( x == 0)); then
		echo "ERROR" :> app.log
	else
		echo "GooD
