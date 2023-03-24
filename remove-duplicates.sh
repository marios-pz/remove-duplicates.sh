#!/bin/bash

# remove duplicate files script

root_dir=$1

for file in "$root_dir"/*; do
	# check if the file is a regular file
	if [ -f "$file" ]; then
		# get the file name
		file_name=$(basename "$file")
		# find all files with the same name in the subdirectories
		duplicate_files=($(find "$root_dir" -name "$file_name" -not -path "$file"))
		# check if there are duplicates
		if [ ${#duplicate_files[@]} -gt 0 ]; then
			# remove the file in the parent director
			echo "removing file $file"
			rm "$file"
		fi
	fi
done
