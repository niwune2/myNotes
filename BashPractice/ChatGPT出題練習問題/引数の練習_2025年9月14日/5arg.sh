#!/bin/bash

if [ -f "$1" ]; then
	echo "ファイル：exists"
else
	echo "ファイル：not found"
fi

