#!/bin/sh

user="$(docker info | awk '/^Username:/ { print $2 }')"
[ -z "$user" ] || user="$user/"

docker build -t "${user}ubuntu32-nginx" .

