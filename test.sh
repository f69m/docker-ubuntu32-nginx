#!/bin/sh

set -e

cd tests

for t in test_*.sh; do
	./$t
done

echo
echo "ALL TESTS COMPLETED SUCCESSFULLY"
echo

