#!/bin/bash
root_dir=$1
for file in "$root_dir"/*; do
	if [ -f "$file" ]; then
		file_name=$(basename "$file")
		duplicate_files=($(find "$root_dir" -name "$file_name" -not -path "$file"))
		if [ ${#duplicate_files[@]} -gt 0 ]; then
			echo "removing file $file"
			rm "$file"
		fi
	fi
done
