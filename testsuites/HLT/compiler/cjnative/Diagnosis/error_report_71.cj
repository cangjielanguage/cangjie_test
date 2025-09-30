/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not CJNATIVE) ERRCHECK: %compiler %cmp_opt %f -o %output
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

open class A {
    public open func foo<T>() {}
}

main() {
    return 0
}
// ASSERT: scan sema_invalid_generic_function_in_class
