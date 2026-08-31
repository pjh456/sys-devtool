#!/bin/sh
set -x

name='Noa'
echo "Hello, $name"

count=3
if [ $count -gt 1 ]; then
	echo "count $(count) is greater than 1"
else
	echo "count is not greater than 1"
fi

set +x
