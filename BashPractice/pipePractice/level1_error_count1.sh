#!/bin/bash

cat error.log | grep -i  "error | warning" | wc -l
