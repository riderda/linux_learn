#!/bin/bash

while read -n1 -p "Do you want to continue [Y/N] ?" answer
do
case $answer in
	Y | y) echo -e "\nis y"
			break
			;;
	N | n) echo -e "\nis n"
			exit
			;;
	*) echo -e "\nplease enter again "
			;;
esac
done
echo " if you can see the 'is y ' "
