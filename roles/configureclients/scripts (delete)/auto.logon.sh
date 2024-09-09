#!/bin/bash

ipaddress=$1
username=$2
password=$3
keypath=$4
pubpath=$5

#pub=$( cat $pubpath | base64 --wrap=0 )
pub=$( cat $pubpath )
IFS=' ' read -a array <<< "$pub"

expect -f $(dirname "$0")/auto.logon.expect "$ipaddress" "$username" "$password" "${array[1]}" "${array[0]}" "$keypath"
if [[ "$?" != "0" ]]; then 
    echo "**** Error: Expect failed"
fi
