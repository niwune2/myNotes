#!/bin/sh

num=$1
label="none"

if (( $num % 15 == 0 )); then
    label="FizzBuzz"
elif (( $num % 5 == 0 )); then
    label="Buzz"
elif (( $num % 3 == 0 )); then
    label="Fizz"
fi

case $label in
    FizzBuzz | Buzz | Fizz)
        echo "$label"
        ;;
    *)
        echo "$num"
        ;;
esac
