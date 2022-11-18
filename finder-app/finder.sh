#!/bin/bash
# Script for finder
# Author: Evan Osborn

filesdir=$1
searchstr=$2

if [  $# -eq 2 ]
then
	if [ -d $filesdir ]
	then
		numfiles=$(ls $filesdir | wc -l)
		mtc=$(grep -r -l $searchstr $filesdir | wc -l)
		echo "The number of files are ${numfiles} and the number of 			matching lines are ${mtc}"
		exit 0
	fi
	
elif [ -z $2 ]
then
	echo "Parameter ${searchstr} not specified"
	exit 1
elif [ -z $1 ]
then
	echo "Parameter ${filesdir} not a directory"
	exit 1
fi

