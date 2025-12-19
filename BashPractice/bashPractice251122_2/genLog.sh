#!/bin/bash

for i in {1..100}; do
	numRandom=$(($RANDOM % 2))
	
	if [ $numRandom -eq 0 ]; then
		echo "status:GOOOD" >> accesss.log
	else
		echo "status:ERROR" >> access.log
	fi
done

