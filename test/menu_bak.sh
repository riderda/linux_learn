#!/bin/bash

PS3="enter your num:"
select option in "1" "2" "3"
do 
	case $option in 
		"1")
			echo 1
			;;
		"2")
			echo 2
			;;
		"3")
			echo 3
			;;
		*)
			echo "*"
	esac
done
clear
