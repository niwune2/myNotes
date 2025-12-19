#!/bin/bash

num=$((RANDOM % 4))

#echo $num

if (( $num == 3 )); then
    echo "WEST"
elif (( $num == 2 )); then
    echo "EAST"
elif (( $num == 1 )); then
    echo "SOUTH"
elif (( $num == 0 )); then
    echo "NORTH"
fi

