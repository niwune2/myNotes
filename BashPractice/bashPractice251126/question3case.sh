#!/bin/bash

x=$1

case $x in
    a | b | c)
        echo "OK";;
    *)
        echo "NG";;
esac

