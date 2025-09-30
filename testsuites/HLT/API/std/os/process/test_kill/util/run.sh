#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

run="$1"

clang test.c -o test.out
nohup ./test.out > /dev/null 2>&1 &
echo $! > test.txt

pid=`eval $run`

if [ -n "$pid" ]; then
  echo "pass1"
  str=`ps -ef | grep "$pid" | grep "test.out"`
  if [ -z "$str" ]; then
    echo "pass2"
  else
    echo "pass3"
  fi
fi
