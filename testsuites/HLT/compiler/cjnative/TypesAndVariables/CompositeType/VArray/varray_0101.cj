/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// (not CJNATIVE) ERRCHECK: %compiler %overflow_wrapping %f %cmp_opt

class A {
    var a: VArray<Int64, $1> = [1]
}

main() {
    var a = A()
    a.a[0] = 0
    return a.a[0]
}
// ASSERT: scan-1 sema_varray_cjvm_in_ref_type
