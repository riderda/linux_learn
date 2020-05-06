#!/bin/bash

fact() {
	if [ $1 -eq 1 ]
	then
		echo 1
	else
		local temp=$[ $1 - 1 ]
		local result=`fact $temp`
		echo $[ $result * $1 ] 
	fi
}

result=`fact 20`
echo $result


