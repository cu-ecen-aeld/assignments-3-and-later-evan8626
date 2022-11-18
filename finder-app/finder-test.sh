#!/bin/sh
# Tester script for assignment 1 and assignment 2
# Author: Siddhant Jajoo

set -e
set -u

NUMFILES=10
WRITESTR=AELD_IS_FUN
WRITEDIR=/tmp/aeld-data
#CURDIR=$(dirname $0)
username=$(cat ../home/conf/username.txt)

if [ $# -lt 2 ]
then
	echo "Using default value ${WRITESTR} for string to write"
	if [ $# -lt 1 ]
	then
		echo "Using default value ${NUMFILES} for number of files to write"
	else
		NUMFILES=$1
	fi	
else
	NUMFILES=$1
	WRITESTR=$2
	WRITEDIR=/tmp/aeld-data/$3
fi

MATCHSTR="The number of files are ${NUMFILES} and the number of matching lines are ${NUMFILES}"

echo "Writing ${NUMFILES} files containing string ${WRITESTR} to ${WRITEDIR}"

# create $WRITEDIR if not assignment3
assignment=`cat ../home/conf/assignment.txt`

#if [ $assignment != 'assignment3' ]
#then
	rm -rf "${WRITEDIR}"
	mkdir -p "$WRITEDIR"

	#The WRITEDIR is in quotes because if the directory path consists of spaces, then variable substitution will consider it as multiple argument.
	#The quotes signify that the entire string in WRITEDIR is a single string.
	#This issue can also be resolved by using double square brackets i.e [[ ]] instead of using quotes.
	if [ -d "$WRITEDIR" ]
	then
		echo "$WRITEDIR created"
	else
		exit 1
	fi
#fi
#echo "Removing the old writer utility and compiling as a native application"
#make clean
#make

#for i in $( seq 1 $NUMFILES)
#do
#	./writer "$WRITEDIR/${username}$i.txt" "$WRITESTR"
#done

#echo "Current directory: "
#for entry in "$CURDIR"/*
#do
#	echo "$entry"
#done

#echo "Write directory: "
#for enter in "$WRITEDIR"/*
#do
#	echo "$enter"
#done

OUTPUTSTRING=$(./finder.sh "$WRITEDIR" "$WRITESTR")

#remove temporary directories
#rm -rf /tmp/aeld-data

set +e
echo ${OUTPUTSTRING} | grep "${MATCHSTR}"
if [ $? -eq 0 ]; then
	echo "success"
	exit 0
else
	echo "failed: expected  ${MATCHSTR} in ${OUTPUTSTRING} but instead found ${OUTPUTSTRING}"
	exit 1
fi
