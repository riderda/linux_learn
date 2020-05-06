#!/bin/bash

arraydblr() {
	local oldarray
	local newarray
	local length
	local i
	oldarray=($(echo "$@"))
	#newarray=(`echo "$@"`) #这句是可以不用的
	length=$[ $# ]
	for((i=0;i<$length;i++)) {
		newarray[$i]=$[ ${oldarray[$i]} * 2 ]
	}
	echo ${newarray[*]}
}

myarray=(0 1 2 3 4)
echo ${myarray[*]}
arraydblr ${myarray[*]} #最重要的是传参有传好
#result=$(arraydblr $myarray)
#echo ${result[*]}
