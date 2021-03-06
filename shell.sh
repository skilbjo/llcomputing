#!/bin/bash

## Commands
UPDATE="sudo pacman -Syyu"
APP=llcomputing
PRCOESS="ps aux | grep node"
SHUTDOWN="sudo shutdown -h now"
GIT="mkdir git ; cd git ; mkdir llcomputing ; cd llcomputing ; git init --bare"
MV="mv ~/app/llcomputing/ ~/llcomputing/"
MPI="cd $APP ; mpiexec --machinefile machinefile --map-by node -n 4 python python/md5_attack.py"

## Assignment
COMMAND=$SHUTDOWN

## Loop functions
function local {
	for i in {1..4}; do
		ssh pi$i $COMMAND
	done	
}

function external {
	for i in {3..6}; do
		echo ssh skilbjo@skilbjo.duckdns.org -p 14$i $COMMAND
	done
}

## Run code
local

exit
