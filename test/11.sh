#!/bin/bash

testit(){
	local newarray
	echo "$@"
	newarray=$(echo "$@")
	echo "这个数组是 ${newarray[*]}"
}
myarray=(0 1 2 3 4)
echo "这个外部的数组是 ${myarray[*]}"
testit ${myarray[*]}
