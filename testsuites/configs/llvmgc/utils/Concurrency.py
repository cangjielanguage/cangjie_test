#!/usr/bin/env python3

import sys
import os

#插入和删除文件内容
def findandreplace(filename):
    try:
        fobj = open(filename, 'r', encoding='utf-8');
        alllines = fobj.readlines()
    except IOError:
        print('------ file open error ------')
    else:
        alllines.append('' + '\n')
        alllines.append('# Spec does not support UnSafePtr.' + '\n')
        alllines.append('LLVM/FFI/C_FFI/c_ffi_002/c_ffi_00206/c_ffi_00206.cj' + '\n')
        alllines.append('LLVM/FFI/C_FFI/c_ffi_002/c_ffi_00205/c_ffi_00205.cj' + '\n')
        alllines.append('LLVM/FFI/C_FFI/c_ffi_003/c_ffi_00301/c_ffi_00301.cj' + '\n')
        alllines.append('LLVM/FFI/C_FFI/c_ffi_003/c_ffi_00302/c_ffi_00302.cj' + '\n')
        alllines.append('LLVM/FFI/C_FFI/c_ffi_003/c_ffi_00303/c_ffi_00303.cj' + '\n')
        alllines.append('LLVM/FFI/C_FFI/c_ffi_003/c_ffi_00306/c_ffi_00306.cj' + '\n')
        alllines.append('' + '\n')
        alllines.append('# Spec does not support value binding' + '\n')
        alllines.append('LLVM/Expressions/LoopExpressions/for-in/for_in_pattern_0403.cj' + '\n')
        alllines.append('LLVM/PatternMatching/Patterns/nest/match_nest2_enum01.cj' + '\n')
        alllines.append('LLVM/PatternMatching/Patterns/nest/match_nest2_valueBinding01.cj' + '\n')
        alllines.append('LLVM/PatternMatching/Patterns/nest/match_nest2_valueBinding0103.cj' + '\n')
        alllines.append('LLVM/PatternMatching/Patterns/nest/match_nest2_valueBinding0106.cj' + '\n')
        alllines.append('LLVM/TypesAndVariables/CompositeType/NewEnum/Pattern/002/enum_pattern_20017.cj' + '\n')
        alllines.append('' + '\n')
        alllines.append('# old library cases' + '\n')
        alllines.append('LLVM/library/Directory' + '\n')
        alllines.append('LLVM/library/Environment' + '\n')
        alllines.append('LLVM/library/File/File' + '\n')
        alllines.append('LLVM/library/IO' + '\n')
        alllines.append('LLVM/library/Math' + '\n')
        alllines.append('LLVM/library/Process' + '\n')
        alllines.append('' + '\n')
        alllines.append('# llvmgc does not support BindosThread' + '\n')
        alllines.append('LLVM/Concurrency/Thread/thread005' + '\n')
        alllines.append('' + '\n')
        alllines.append('# Exclude cases under Panda.' + '\n')
        alllines.append('LLVM/Exception/Panda' + '\n')
        alllines.append('' + '\n')
        dflag = []
        for _ in range(0, len(alllines)):
            if 'LLVM/AD' in alllines[_]:
                dflag.append(alllines[_])
            if 'LLVM/FFI_JNI' in alllines[_]:
                dflag.append(alllines[_])
            if 'LLVM/DebugInfo' in alllines[_]:
                dflag.append(alllines[_])
            if 'EXCLUDE-TEST-CASE' in alllines[_]:
                break
        if dflag:
            for _ in range(0, len(dflag)):
                alllines.remove(dflag[_])
        for _ in range(0, len(alllines)):
            if 'EXCLUDE-TEST-CASE' in alllines[_]:
                alllines.insert(_ - 1, '' + '\n')
                #alllines.insert(_ - 1, 'LLVM/Concurrency' + '\n')
                alllines.insert(_ - 1, 'LLVM/FFI_JNI/c_ffi/c_ffi_005' + '\n')
                alllines.insert(_ - 1, 'LLVM/FFI_JNI/c_ffi/c_ffi_006' + '\n')
                alllines.insert(_ - 1, 'LLVM/FFI_JNI/c_ffi/c_ffi_007' + '\n')
                alllines.insert(_ - 1, 'LLVM/FFI_JNI/c_ffi/c_ffi_008' + '\n')
                alllines.insert(_ - 1, 'LLVM/FFI_JNI/c_ffi/c_ffi_009' + '\n')
                alllines.insert(_ - 1, 'LLVM/FFI_JNI/c_ffi/c_ffi_010' + '\n')
                alllines.insert(_ - 1, 'LLVM/FFI_JNI/c_ffi/c_ffi_011' + '\n')
                alllines.insert(_ - 1, 'LLVM/FFI_JNI/c_ffi/c_ffi_012' + '\n')
                alllines.insert(_ - 1, 'LLVM/FFI_JNI/c_ffi/c_ffi_013' + '\n')
                #alllines.insert(_ - 1, 'LLVM/Exception' + '\n')
                #alllines.insert(_ - 1, 'LLVM/DebugInfo' + '\n')
                #alllines.insert(_ - 1, 'LLVM/USG/23FFI' + '\n')
                break
        fobj.close()
        fwobj = open(filename, 'w', encoding='utf-8');
        for n in alllines:
            fwobj.write(n)
        fwobj.close()

if __name__ == '__main__':
    findandreplace(sys.argv[1])