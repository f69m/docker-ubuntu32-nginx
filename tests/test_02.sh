#!/bin/sh

set -e

. ./testlib.sh

rm -rf tmp || true
mkdir tmp

cat <<EOF >tmp/Dockerfile
FROM f69m/ubuntu32-nginx
COPY content /usr/share/nginx/html
EOF
cp -r content tmp/

docker build -t test-nginx tmp >tmp/build.log 2>&1

run test-nginx
check_static http://$IP/
stop

rm -rf tmp
docker rmi test-nginx >/dev/null

true

