# !/bin/bash


function all(){
	echo 'Choose your interface'
	read interface
	echo 'IP in current subnet'		
	net=`nmcli dev show $interface | awk 'NR==9' | cut -d: -f2 | sed 's/ //g'`
	nmap -sn $net | grep 'Nmap' | cut -d' ' -f5 | grep -v 'http' | head -n -1
}


function target(){
	echo 'Open TCP ports'
	nmap -sT -O 127.0.0.1  | grep -P '[0-9]{1,5}/'tcp''
}


function empty(){
	echo 'Choose parametr'
	echo '--all	displays the IP addresses and symbolic names of all hosts in the current subnet'
	echo '--target	key displays a list of open system TCP ports'
}


case $1 in
	'--all')
		all
		;;
	'--target')
		target
		;;
	'')
		empty
		;;
	*)
		echo 'incorrect parameter'
		;;
esac

