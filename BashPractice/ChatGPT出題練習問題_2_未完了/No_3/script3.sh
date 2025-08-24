#!/bin/bash

# ファイル名のうち、`_`より前を削って`report`を入れる
# `i`には、変更前のファイル名が入る

rm -f data_*.txt
touch data_{001..002}.txt


for i in data_*.txt; do
	mv "$i" "report_${i#*_}"
done

