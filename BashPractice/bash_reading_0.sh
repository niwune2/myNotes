#!/bin/bash

name="backup_$(date +%Y%m%d)"

src_dir="docs"

if [ ! -d "$src_dir" ]; then 
	echo "Source missing: $src_dir" >&2; exit 1; 
fi

mkdir -p "$name"

list_file="$name/file_list.txt"

find "$src_dir" -type f -print | sed 's!.*/!!' > "$list_file"

count=$(wc -l < "$list_file")

echo "Found $count files" >> "$name/log.txt"

compress() { tar -czf "$name/archive.tar.gz" -C "$src_dir" .; }

compress

