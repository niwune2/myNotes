#!/bin/bash

num=$((RANDOM % 4))

case $num in
    3)
        echo "WEST";;
    2)
        echo "EAST";;
    1)
        echo "SOUTH";;
    0)
        echo "NORTH";;
esac
