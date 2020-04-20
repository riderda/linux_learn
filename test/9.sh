#!/bin/bash
tempfile=$(mktemp test.XXXXXX)
exec 3>$tempfile
echo 1 >&3
echo 2 >&3
echo 3 >&3
exec 3>&-
cat $tempfile
rm -f $tempfile 2>/dev/null
