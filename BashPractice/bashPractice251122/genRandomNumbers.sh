#!/bin/bash

num_random_min=1
num_random_max=20
num_random=$(($(($RANDOM % ($num_random_max - $num_random_min + 1))) + $num_random_min))

echo "合計 ${num_random}回ループします"

for i in $(seq 1 $num_random); do
    touch practice_$i.log
done

for j in $(seq 1 $num_random); do
    touch other_$j.txt
done


