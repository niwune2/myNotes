#!/bin/bash

num=$1

if (( $num % 15 == 0 )); then
    echo "$num is FizzBuzz"
elif (( $num % 5 == 0 )); then
    echo "$num is Buzz"
elif (( $num % 3 == 0 )); then
    echo "$num is Fizz"
else
    echo "$num"
fi

