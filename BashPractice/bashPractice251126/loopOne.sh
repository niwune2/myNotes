#!/bin/bash

x=$1
a=none

if (( $x < 0 )); then
    $a=NEGATIVE
elif (( $x == 0 )); then
    $a=ZERO
else
    $a=POSITIVE
fi

case $a in
    NEGATIVE)
        echo "$a"
        ;;
    ZERO)
        echo "$a"
        ;;
    POSITIVE)
        echo "$a"
        ;;
esac

