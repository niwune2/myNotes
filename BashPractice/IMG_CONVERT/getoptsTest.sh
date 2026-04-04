#!/bin/bash


while getopts ":i:o:w:f:b" OPTION
do
    case $OPTION in
        i) input_dir=$OPTARG;;
        o) output_dir=$OPTARG;;
        w) width=$OPTARG;;
        f) format=$OPTARG;;
        b) backup=true;;
        *) usage; exit 1;;
    esac
done

echo "input: $input_dir, output: $output_dir, width: $width, format: $format"
