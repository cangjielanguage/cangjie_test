/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: test.c foo.c
// EXEC: %clang %clang_opt -o libtest.%test_suffix test.c
// EXEC: %clang %clang_opt -o libfoo.%test_suffix foo.c
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --library foo --library test --library-path . --output %output
// (CJNATIVE) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Hello World
// ASSERT: scan Hello Foo

foreign func printHello(): Unit

foreign func printFoo(): Unit

main() {
    unsafe {
        printHello()
        printFoo()
    }
    return 0
}
