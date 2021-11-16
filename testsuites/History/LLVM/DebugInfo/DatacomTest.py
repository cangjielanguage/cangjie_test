import sys
import os
import subprocess
import pexpect
#filename = sys.argv[1] # actual debug info filename
expected = sys.argv[1]

num = 1
f_e = open(expected)

# 定义函数dotest：lldb 指令发送及运行结果匹配
def dotest(doline,result):
    process.sendline(doline)
    index = process.expect([result, pexpect.EOF, pexpect.TIMEOUT])
    indextest(index)
    return

# 定义函数indextest： 判断指令运行匹配一致情况
def indextest(index):
    if index == 0:
        print("pass: "+doline)
    else:
        print("ERROR: "+doline)
        sys.exit(1)
    return

lines_e = f_e.readlines()
for line_e in lines_e:
    # 对expected.txt的每一行进行运行
    # comdline：指令场景
    comdline = line_e.split(",")[0]
    # doline：指令命令
    doline = line_e.split(",")[1]
    # result：指令运行后预期结果
    result = line_e.split(",")[2].replace("\n", "")
    print("__________________________")
    print("|"+comdline+"|")
    print("|"+doline+"|")
    print("|"+result+"|")

    print("start-comd:", num)
    num = num + 1
    if comdline == "lldb": # 指令是lldb时，初始入口，超时时间为 3s
        process = pexpect.spawn(doline,timeout=3)
        index = process.expect([result, pexpect.EOF, pexpect.TIMEOUT])
        indextest(index)

        # 导入cjcmd.py包
        process.sendline("command script import cjcmd.py")
        index = process.expect(["cjdb", pexpect.EOF, pexpect.TIMEOUT])
        indextest(index)
    elif comdline == "rerun": # 指令是 rerun 时，执行rerun操作
        process.sendline(doline)
        index = process.expect(["restart", pexpect.EOF, pexpect.TIMEOUT])
        if result == "n": # rerun后 输入 n,则取消rerun
            process.sendline(result)
        else:
            process.sendline("y")   # rerun后 输入 y,则执行rerun
            index = process.expect([result, pexpect.EOF, pexpect.TIMEOUT])
        indextest(index)
    elif comdline == "quit" or comdline == "exit": # 指令是 quit 或 exit 时，执行退出操作
        process.sendline(doline)
        index = process.expect(["proceed", pexpect.EOF, pexpect.TIMEOUT])
        process.sendline(result)
        indextest(index)
    else:
        dotest(doline,result)
    print("__________________________")

f_e.close()
