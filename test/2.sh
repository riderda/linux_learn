#!/bin/bash

for i in /home/chenweida/*
do
	if [ -d "$i" ] 
	then
			echo $i
	fi
done > out.txt
