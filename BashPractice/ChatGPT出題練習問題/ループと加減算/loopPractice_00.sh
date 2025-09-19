#!/bin/bash

#mkdir backup(date:yymmdd)

png=( "a" "b" "c" "d" "e" "f" "g" )

jpg=()

# pngを大文字に変えてjpgに入れる

for i in "${png[@]}"; do
    echo "$i"
done


#for i in {1..10}; do
#    for j in {1..10}; do
#        for k in {1..10}; do
#            echo "$i × $j × $k = $((i*j*k))"
#        done
#    done
#done