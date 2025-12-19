#!/bin/bash

for i in {1..100}; do
    if [ $i % 2 -eq 0 ]; then
        echo "$i_OK"
    else
        echo "$i_NO"
    fi
done
