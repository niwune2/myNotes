#!/bin/bash

mkdir -p logs

for i in {1..10}; do
    touch "logs/access_$i.log"
done
