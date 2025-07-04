#!/bin/bash

echo "fedora1" > /tmp/gdb.stdin

ARGS="--opt1 --opt2"

/usr/bin/gdb \
  --batch \
  -ex "run ${ARGS} < /tmp/gdb.stdin" \
  -ex "show args" \
 ./main
