#!/bin/bash

count=1

for i in *.png; do
	newname=$(printf "img_%03d.png" "$count")
	echo mv "$i" "$newname"
	count=$((count+1))
done

