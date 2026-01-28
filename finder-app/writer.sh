#!/bin/sh
writefile="$1"
writestr="$2"
number_of_parameters="$#"
directory_path=$(dirname "$writefile")

echo "writefile: $writefile"
# echo "writestr: $writestr"
# echo "number_of_parameters: ${number_of_parameters}"

if [ "$number_of_parameters" -ne 2 ]; then
	echo "Parameters are not correct!"
	echo "The first argument is a full path to a file (including filename) on the filesystem."
	echo "The  second argument is a text string which will be written within this file."
	exit 1
fi

if ! mkdir -p "$directory_path"; then
	echo "Creation of the path failed!"
	exit 1
fi

if ! echo "$writestr" > "$writefile"; then
	echo "File could not be created!"
	exit 1
fi
