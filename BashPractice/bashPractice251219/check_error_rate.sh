#!/bin/bash


count=$(grep -o "ERROR" app.log | wc -l)

allLogs=$(cat app.log|wc -l)

echo "$(($count*10/$allLogs*10))""%"
