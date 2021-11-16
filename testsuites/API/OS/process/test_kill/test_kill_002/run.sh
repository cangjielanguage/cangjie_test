#!/bin/bash

clang -shared -fPIC cstr2int.c -o libcstr2int.so
export LD_LIBRARY_PATH=$PWD:$LD_LIBRARY_PATH

stdx_cmp_opt="$1 $2"
cjc $stdx_cmp_opt -backend-options="-L%%stdx-package  -lcangjie-ffic -lcangjie-os -L. -lcstr2int" ./test_kill_002.cj -o test_kill_002.out

clang test.c -o test.out
nohup ./test.out > /dev/null 2>&1 &
echo $! > test.txt

pid=`LD_LIBRARY_PATH=$LD_LIBRARY_PATH:%stdx-package && ./test_kill_002.out`

if [ -n "$pid" ]; then
  echo "pass1"
  str=`ps -ef | grep "$pid" | grep "test.out"`
  if [ -n "$str" ]; then
    echo "pass2"
  fi
fi
