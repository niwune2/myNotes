#!/bin/bash

x=$(($RANDOM % 2))

if (( x < 0 )); then
    echo "NEGATIVE"
elif (( x = 0 )); then

