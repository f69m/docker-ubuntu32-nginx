

# Find current dir to build absolute paths
PWD=$(pwd)

# Clean up left-overs
docker kill test-nginx >/dev/null 2>&1 || true
docker rm test-nginx >/dev/null 2>&1 || true

# Find name of test
TEST=${0#./}
TEST=${TEST%.sh}


run() {
	CID=$(docker run -d --name test-nginx $@)
	IP=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' $CID)
}

stop() {
	docker kill $CID >/dev/null
	docker rm $CID >/dev/null
}

check_static() {
	url=$1
	d1=$(curl -s $url)
	d2=$(cat content/index.html)
	if [ "$d1" = "$d2" ]; then
		echo "$TEST succeeded ($d1)"
		true
	else
		echo "$TEST failed ($d1)"
		false
	fi
}

