#!/bin/bash
user=$(id -u) 
echo "$user"
if [ $user -ne 0 ] #date=$(date), If = [], while = [ ], for = {}++++ echo "${array[@]}"
then
        echo "not root user"
        exit 1
fi

yum install git -y

if [ $? -ne 0 ]
then
        echo "failure"
exit 1
else
        echo "success"
fi