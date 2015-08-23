#!/bin/sh

set -e

. ./testlib.sh

run -v $PWD/content:/usr/share/nginx/html:ro f69m/ubuntu32-nginx

check_static http://$IP/

stop

true

