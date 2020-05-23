#!/bin/bash

temp=$(mktemp -t temp.XXXXXX)
temp2=$(mktemp -t temp.XXXXXX)
 
diskspace() {
	df -k > $temp
	zenity --text-info --title "磁盘使用情况" --filename=$temp --width 750 --height 1000
}

whoseon() {
	who > $temp
	zenity --text-info --title "登录的用户" --filename=$temp --width 500 --height 100
}

menusage() {
	cat /proc/meminfo >$temp
	zenity --text-info --title "内存使用情况" --filename=$temp --width 300 --height 500
}

while [ 1 ]
do
	zenity --list --radiolist --title "用户系统" --width 500 --height 400 --column "Select" --column "Menu Item" FALSE "显示磁盘使用情况" FALSE "显示用户" FALSE "显示内存使用情况" FALSE "退出系统" >$temp2 
	if [ $? -eq 1 ] 
	then
		break
	fi

	selection=$(cat $temp2)

	case $selection in
		"显示磁盘使用情况")
				diskspace
				;;
		"显示用户")
				whoseon
				;;
  		"显示内存使用情况")
				menusage
				;;
		"退出系统")
				break
				;;
		*)
				zennity --info "对不起,您的输入有误"
	esac
done

