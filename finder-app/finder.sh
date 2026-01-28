#!/bin/sh
filesdir="$1"
searchstr="$2"
number_of_parameters="$#"

# echo "filesdir: ${filesdir}"
# echo "searchstr: ${searchstr}"
# echo "number_of_parameters: ${number_of_parameters}"

if [ "$number_of_parameters" -ne 2 ]; then
	echo "Parameters are not correct!"
	echo "The first argument is a path to a directory on the filesystem."
	echo "The second argument is a text string which will be searched within these files."
	exit 1
fi

if [ ! -d "$filesdir" ]; then
	echo "${filesdir} is NOT a directory on the filesystem."
	exit 1
fi

number_of_files=$(find "$filesdir" -type f | wc -l)
number_of_matching_lines=$(grep -r --binary-files=without-match "$searchstr" "$filesdir" | wc -l)

echo "The number of files are ${number_of_files} and the number of matching lines are ${number_of_matching_lines}"
