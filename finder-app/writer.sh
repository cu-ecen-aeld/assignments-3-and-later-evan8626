#!/bin/bash
# Script for writer
# Author: Evan Osborn

writefile=$1
writestr=$2

if [ -z $# ] 
then
	echo "Parameter not specified"
	exit 1
elif [ -z $1 ]
then 
	echo "Parameter 1 is not set as a directory"
	exit 1
elif [ -z $2 ]
then
	echo "Write string not specified"
	exit 1
elif [  $# -eq 2 ]
then
	echo writestr > $filename
	exit 0
fi
