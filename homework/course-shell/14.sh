#!/bin/sh
if [ $# -lt 1 ]; then
	echo "Directory cannot be empty!"
	exit 1
fi

DIR=$1

if [ ! -d $DIR ]; then
	echo "Given path is not a directory!"
	exit 1
fi

find $DIR -type f -name "*.sh" -print0 | xargs -0 wc -l
