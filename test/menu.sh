#!/bin/bash
diskspace(){
	clear
	df -k
}

whoseon(){
	clear
	who
}

menusage(){
	clear
	cat /proc/meminfo
}
PS3="Enter option: "
select option in "Display disk space" "Display logged on users" "Display memory usage" "Exit program"
do
	case $option in
		"Exit program")
				break
				;;
		"Display disk space")
				diskspace
				;;
		"Display logged on users")
				whoseon
				;;
		"Display memory usage")
				menusage
				;;
		*)
				clear
				echo "Sorry, wrong selectiom"
				;;
	esac
done
clear


