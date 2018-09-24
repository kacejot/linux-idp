#!/bin/bash

login_definitions="/etc/login.defs"
users_information="/etc/passwd"
 
min_user_uid=$(grep "^UID_MIN" $login_definitions)
max_user_uid=$(grep "^UID_MAX" $login_definitions)

if [[ -z $1 ]]
then
    awk -F":" -v "min=${min_user_uid##UID_MIN}" -v "max=${max_user_uid##UID_MAX}" \
        '{ if ( $3 >= min && $3 <= max ) { print "username: " $1; print "uid: " $3; print "gid: " $4; print "dir: " $6; print "shell: " $7; print "" }}' \
        "$users_information"
else
    awk -F":" -v "min=${min_user_uid##UID_MIN}" -v "max=${max_user_uid##UID_MAX}" -v "username=$1" \
        '{ if ( $3 >= min && $3 <= max && username == $1) { print "username: " $1; print "uid: " $3; print "gid: " $4; print "dir: " $6; print "shell: " $7; print "" }}' \
        "$users_information"
fi

