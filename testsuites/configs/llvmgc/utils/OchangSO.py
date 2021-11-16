#!/usr/bin/env python3

import sys
import os

#根据文件扩展名判断文件类型
def endwith(s,*endstring):
    array = map(s.endswith,endstring)
    if True in array:
        return True
    else:
        return False

#将生成.o的语句改写为生成.so
def makeso(fileline, output):
    if 'EXEC:' in fileline and '-o' in fileline and '.o' in fileline:
        linklist = fileline.split( )
        mc = 0
        for _ in range(0, len(linklist)):
            if linklist[_] == '-c':
                mc = 1
            if '.o' in linklist[_]:
                if '/' in linklist[_]:
                    linklist[_] = 'lib' + linklist[_].split('/')[-1].replace('.o', '.so')
                else:
                    linklist[_] = 'lib' + linklist[_].replace('.o', '.so')
        for _ in range(0, len(linklist)):
            if linklist[_] == '-o':
                index = _ - len(linklist)
                if '%clang' in fileline:
                    linklist.insert(index, '-shared -fPIC')
                if '%compiler' in fileline:
                    linklist.insert(index, "-backend-options='-shared -fPIC'")
                break
        if mc == 1:
            linklist.remove('-c')
        output.append(' '.join(linklist))
        return True
    else:
        return False

#将链接.o的语句改写为链接.so
def linkso(fileline, output):
    if '%f' in fileline and '.o' in fileline:
        if '-o %output' in fileline or '-o %n.%suffix' in fileline:
            if 'EXEC:' in fileline or 'EXEC-PIPE:' in fileline:
                keys = ''
                linklist = fileline.split( )
                for _ in range(len(linklist)-1, -1, -1):
                    if '.o' in linklist[_]:
                        if '/' in linklist[_]:
                            keys += '-l' + linklist[_].split('/')[-1].replace('.o', ' ')
                        else:
                            keys += '-l' + linklist[_].replace('.o', ' ')
                        del linklist[_]
                keys = "-backend-options='-L./ " + keys + "'"
                for _ in range(0, len(linklist)):
                    if linklist[_] == '-o':
                        index = _ - len(linklist)
                        linklist.insert(index, keys)
                        break
                output.append(' '.join(linklist))
                return True
            else:
                return False
        else:
            return False
    else:
        return False

#将文件中变量替换掉
def change_var(filename):
    try:
        fobj = open(filename, 'r', encoding='utf-8',newline = "")
        alllines = fobj.readlines()
    except (UnicodeDecodeError, IOError):
        print('------ file open error:', filename, ' ------')
    else:
        for _ in range(0, len(alllines)):
            if '%middle' in alllines[_]:
                alllines[_] = alllines[_].replace('%middle', 'o')
            if '%n.cj' in alllines[_]:
                alllines[_] = alllines[_].replace('%n.cj', '%f')
        fobj.close()
        fwobj = open(filename, 'w', encoding='utf-8',newline = "")
        for n in alllines:
            fwobj.write(n)
        fwobj.close()

#查找文件并进行替换
def findandreplace(dirname):
    for root,dirs,files in os.walk(dirname):
        for file in files:
            if endwith(file,'.cj'):
                filename = root + os.sep + file
                change_var(filename)
                fobj = open(filename, 'r', encoding='utf-8',newline = "")
                alllines = fobj.readlines()
                for _ in range(0, len(alllines)):
                    output =[]
                    flag = 0
                    if linkso(alllines[_], output):
                        #print("linkso:",output[0])
                        alllines[_] = output[0] + '\n'
                        flag = 1
                        break
                for _ in range(0, len(alllines)):
                    output =[]
                    if flag == 1 and makeso(alllines[_], output):
                        #print("makeso:",output[0])
                        alllines[_] = output[0] + '\n'
                fobj.close()
                fwobj = open(filename, 'w', encoding='utf-8',newline = "")
                for n in alllines:
                    fwobj.write(n)
                fwobj.close()

if __name__ == '__main__':
    findandreplace(sys.argv[1])