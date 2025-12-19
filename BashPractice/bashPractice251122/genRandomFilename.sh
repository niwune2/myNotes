#!/bin/bash

for i in {1..100};do
    numRandom=$(($RANDOM % 2))

    if [ $numRandom -eq 1 ]; then
        echo "log:fatal" >> application.log
    else
        echo "good" >> application.log
    fi
done
