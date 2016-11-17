#!/bin/bash

# This script will publish the npm package specifed given the username password and email provided

if [ "$1" = "-h" ]; then
	echo "Usage npm-pub <package path> <username> <password> <email>"
	exit
fi

cd $1

scr_name="npm_pub$RANDOM"

screen -dmS $scr_name bash -c 'npm login && npm publish > npm_pub.log'

screen -p 0 -S $scr_name -X eval "stuff \"$2\"\015"
sleep 0.25

screen -p 0 -S $scr_name -X eval "stuff \"$3\"\015"
sleep 0.25

screen -p 0 -S $scr_name -X eval "stuff \"$4\"\015"
