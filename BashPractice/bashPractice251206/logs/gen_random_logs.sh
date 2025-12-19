#!/bin/bash

count=10

for ((i=1; i<=count; i++)); do
    touch "access_$i.log"
done
