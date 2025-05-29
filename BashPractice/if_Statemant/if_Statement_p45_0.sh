#!/bin/bash

cmp -s file1.txt file2.txt

if [ $? -eq 0 ]
then
	echo 'file1.txtとfile2.txtの内容は同じです'
else
	echo 'file1.txt とfile2.txtの内容は違います'
fi
