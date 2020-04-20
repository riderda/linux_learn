#!/bin/bash

while getopts :ab:cd opt
do
	echo "start :optind is $OPTIND"
	case "$opt" in
		a) echo "is a , optind is $OPTIND"
			;;
		b) echo "is b , value is $OPTARG, optind is $OPTIND" 
			;;
		c) echo "is c, optind is $OPTIND"
			;;
		d) echo "is d, optind is $OPTIND "
			;;
		*) echo "???"
	esac
	echo "end :optind is $OPTIND"
done

				
