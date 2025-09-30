/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output
// (not Windows) RUN-EXEC-PIPE: a=$PWD && b=`%run %run_opt %output %run_args` && if [ $a = $b ];then echo "pass";fi | compare %f
// (not Windows) ASSERT: scan pass

import std.process.*
import std.fs.*

unsafe main() {
    var str: String = FileInfo(Process.current.workingDirectory).path.toString()

    print(str)

    return 0
}
