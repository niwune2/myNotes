#!/bin/bash

for i in {1..100}; do
    numRand=$(($RANDOM % 2))
    if [ $numRand -eq 0 ]; then
        echo "warning" >> system.log
    else
        echo "ok" >> system.log
    fi
done

