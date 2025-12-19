#!/bin/bash

for i in {1..100}; do
    numRand=$(($RANDOM % 2))

    if [ $numRand -eq 0 ]; then
        echo "ERROR" >> app.log
    else
        echo "OK" >> app.log
    fi
done
