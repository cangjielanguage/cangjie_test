#!/bin/bash

clang -shared -fPIC cstr2int.c -o libcstr2int.so

cjc %stdx_cmp_opt -backend-options="-L%%stdx-package  -lcangjie-ffic -lcangjie-os -L. -lcstr2int" ./test_killpg_007.cj -o test_killpg_007.out

clang test.c -o test.out
nohup ./test.out > /dev/null 2>&1 &

a=`ps -ef | grep test.out`

b=($a)

echo "${b[1]}" > test.txt

pid=`LD_LIBRARY_PATH=$LD_LIBRARY_PATH:%stdx-package && ./test_killpg_007.out`

if [ -n "$pid" ]; then
  echo "pass1"
  str=`ps -ef | grep "$pid" | grep "test.out"`
  if [ -n "$str" ]; then
    echo "pass2"
  fi
fi
