#!/bin/bash

mkdir -p work_dummy/

cd  work_dummy/

for i in {1..10}; do
     printf "%03d\n" $i
     date +%Y%m%d:
done

