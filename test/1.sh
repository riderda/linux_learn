#!/bin/bash
IFS.OLD=$IFS
IFS=$'\n'
for i in $(cat /etc/passwd);do
		echo "value in $i -"
		IFS=:
		for j in $i;do
				echo $j
		done
done



