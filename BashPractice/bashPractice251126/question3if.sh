#!/bin/bash

x=$1

if [[ $x = "a" || $x = "b" || $x = "c" ]]; then
    echo "OK"
else
    echo "NG"
fi

