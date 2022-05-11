#!/bin/bash

operateService() {
        read -p "Would you like to start $1? [y/n] " shouldStartService

	if [[ "$shouldStartService" = "y" ]]; then
		`systemctl start $1`
		echo "$1 has been started!"
	elif [[ "$shouldStartService" = "n" ]]; then
		echo "You rejected start $1"
	else
		operateService $1
	fi
}

grepStatus() {
	isServiceExists=`systemctl status $1 2>&1 | grep -o "not be found"`
	serviceStatus=`systemctl status $1 | grep -o " active"`
	
	if [[ "$isServiceExists" = "not be found" ]]; then

		echo "Error"

	elif [[ "$serviceStatus" = " active" ]]; then

		echo "$1 status: $serviceStatus"
	else
		operateService $1 $serviceStatus
	fi
			
}

serviceCheck(){
	while :
	do
		read -p "Name of the service you want to check [q to exit] " nameOfService
		
		if [[ "$nameOfService" = "q" ]]; then
			break
		else
			grepStatus $nameOfService
		fi
	done
}

grepStatus docker
grepStatus fwupd-refresh
grepStatus virtualbox
serviceCheck
