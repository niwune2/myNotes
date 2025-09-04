#!/bin/bash

f="my.data.backup.tar.gz"

echo "1. ${f%.*}"
echo "2. ${f%%.*}"
echo "3. ${f##*.}"
