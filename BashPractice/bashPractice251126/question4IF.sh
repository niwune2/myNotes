#!/bin/bash

RANDOM=$1


if (( $RANDOM % 4 == 3 )); then
    echo "WEST"
elif (( $RANDOM % 4 == 2 )); then
    echo "EAST"
elif (( $RANDOM % 4 == 1 )); then
    echo "SOUTH"
elif (( $RANDOM % 4 == 0 )); then
    echo "NORTH"
fi

