#!/bin/bash
user=$1
dir=$2

function isUserExist {
if grep $user /etc/passwd
then
echo "User: $user exist"
else
echo "User: $user dosn't exist"
exit
fi
}

function isDirExist {
if [ -d "$dir" ];
then
echo "DIR: $dir exist"
else
echo "DIR: $dir dosn't exist"
exit
fi
}

function isUserRoot {
if [ $UID -eq 0 ];
then
echo "$user is root"
else
echo "$user dosn't root"
exit
fi
}

function changeOwner {
chown -R "$user:$user" "$dir"
}

isUserExist
isDirExist
isUserRoot
changeOwner


