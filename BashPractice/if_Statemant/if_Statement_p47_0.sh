#!/bin/bash

if [ "$1" -eq 3 ] 
then
	if [ "$2" -eq 5 ]
	then
		echo 'i=3かつj=5です'
	else
		echo 'i=3かつj≠5です'
	fi
else
	if [ "$2" -eq 5 ]
	then
		echo 'i≠3かつj=5です'
	else
		echo 'i≠3かつj≠5です'
	fi
fi
