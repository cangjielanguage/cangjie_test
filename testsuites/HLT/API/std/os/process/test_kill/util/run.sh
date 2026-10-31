#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

run="$1"

# Only clean up the target process of THIS run (recorded in test.txt).
# Never pkill by name: all test_kill cases share this script, and a global
# "pkill -9 -f test.out" kills the target process of concurrently running
# cases, making pass3 flake into pass2. Check /proc comm before killing to
# avoid acting on a recycled PID left over from a previous run.
cleanup() {
  if [ -f test.txt ]; then
    local target
    target=$(cat test.txt 2>/dev/null)
    if [ -n "$target" ] && [ "$(cat /proc/"$target"/comm 2>/dev/null)" = "test.out" ]; then
      kill -9 "$target" 2>/dev/null
    fi
  fi
  return 0
}

cleanup
sleep 0.1

clang test.c -o test.out
nohup ./test.out > /dev/null 2>&1 &
echo $! > test.txt

sleep 0.2

pid=`eval $run`

if [ -n "$pid" ]; then
  echo "pass1"
  str=`ps -p "$pid" -o comm= 2>/dev/null`
  if [ -n "$str" ] && echo "$str" | grep -q "test.out"; then
    echo "pass3"
  else
    echo "pass2"
  fi
fi

cleanup
