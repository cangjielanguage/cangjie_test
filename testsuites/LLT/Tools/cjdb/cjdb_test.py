#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import sys
import os
import subprocess
import pexpect
import datetime
import signal
expected = sys.argv[1]

num = 1
f_e = open(expected)
lines_e = f_e.readlines()
test_index = lines_e.index("test#\n")
if "description#\n" in lines_e:
    description_index = lines_e.index("description#\n")
    lines_e = lines_e[test_index+1:description_index]
else:
    lines_e = lines_e[test_index+1:]

# 定义函数dotest：cjdb 指令发送及运行结果匹配
def dotest(doline,result):
    process.sendline(doline)
    result = '\n[\s\S]*'+result+'[\s\S]*\(cjdb\)'
    # 兼容黄色箭头
    result_yellow = result.replace("->","\\033\[33m->\\033\[0m")
    reslut_yellow_extra = result.replace("->","->^\[\[0m")
    index = process.expect([result,result_yellow,reslut_yellow_extra,pexpect.EOF,pexpect.TIMEOUT],timeout=55)    # timeout=10
    if index in [0,1,2]:
        index = 0
    indextest(index)
    return

# 定义函数indextest： 判断指令运行匹配一致情况
def indextest(index):
    if index != 0:
        print("ERROR: "+doline)
        error_log = str(process.before.strip())
        print(error_log.replace('\\r', '').replace('\\n', '\n '))
        process.sendline("q")
        process.sendline("y")
        process.wait()
        f_e.close()
        process.kill(0)
        try:
            os.killpg(process.pid, signal.SIGTERM)
        except ProcessLookupError:
            pass
        os._exit(1)

    elif index ==0:
        pass
    return


for line_e in lines_e:
    for char in line_e:
        if not char.isalpha() and not char.isdigit() and char != " ":
            symbol = char
            break
    comdline = line_e.split(symbol)[0]  # comdline：指令场景
    doline = line_e.split(symbol)[1]  # doline：指令命令
    result = symbol.join(line_e.split(symbol)[2:]).replace("\n", "") # result：指令运行后预期结果

    print("__________________________")
    print("|"+comdline+"|")
    print("|"+doline+"|")
    print("|"+result+"|")

    print("start-comd:", num)
    num = num + 1
    if comdline == "cjdb": # 指令是lldb时，初始入口，超时时间为 3s ,默认是30s
        process = pexpect.spawn(doline,timeout=5,encoding = 'utf-8',maxread=3000) # maxread=2000
        result = '\n[\s\S]*'+result+'[\s\S]*\(cjdb\)'
        index = process.expect([result, pexpect.EOF, pexpect.TIMEOUT])

    elif comdline == "rerun": # 指令是 rerun 时，执行rerun操作
        process.sendline(doline)
        index = process.expect(["restart", pexpect.EOF, pexpect.TIMEOUT],timeout=60)
        if result == "n": # rerun后 输入 n,则取消rerun
            process.sendline(result)
        else:
            dotest("y",result)

    elif comdline == "quit" or comdline == "q" or comdline == "exit": # 指令是 quit 或 exit 时，执行退出操作
        process.sendline(doline)
        process.sendline('y')
        process.wait()
        break

    else:
        dotest(doline,result)

    print("__________________________")

# 用例没有q，自动补充退出调试操作操作
if not (comdline == "quit" or comdline == "q" or comdline == "exit"):
    process.sendline("q")
    process.sendline("y")
    process.wait()

# 关闭文件，杀死进程
f_e.close()
process.kill(0)
try:
    os.killpg(process.pid, signal.SIGTERM)
except ProcessLookupError:
    pass
os._exit(0)
