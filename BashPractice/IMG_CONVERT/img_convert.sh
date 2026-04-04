#!/bin/bash

usage() {
  echo "Usage: $0 -i input_dir -o output_dir -w 512 -f webp -b"
}

if [ $# -eq 0 ]; then
    usage
    exit 1 
fi

case "$1" in
    -h | --help)
        usage
        exit 0
        ;;
esac

while getopts ":i:o:w:f:b" OPTION
do
    case "$OPTION" in
        i) input_dir="$OPTARG";;
        o) output_dir="$OPTARG";;
        f) format="$OPTARG";;
        w) width="$OPTARG";;
        b) backup=true;;
        *) usage; exit 1;;
    esac
done

echo "input: $input_dir, output: $output_dir, width: $width, format: $format, backup: $backup"

shift $((OPTIND -1))