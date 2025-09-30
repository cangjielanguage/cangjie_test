/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: pkg cfg.json cfg-main.json c_ffi.c
// (not Windows) EXEC: %clang %clang_opt c_ffi.c -o libc_ffi.%test_suffix
// (not Windows) EXEC: %sed %sed_opt "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// (not Windows) EXEC: %sed %sed_opt "s!cangjieCFFI_path!%cstring_cjo!g" cfg-main.json
// ((OHOS or not MAC) and not Windows) EXEC: %compiler %cmp_opt %pkg_compile pkg/pkg.cj -o libpkg.%test_suffix
// ((OHOS or not MAC) and not Windows) ERRCHECK: %compiler %cmp_opt %f %pkg_link -o %output --dy-std
// ((OHOS or not MAC) and not Windows) ASSERT: scan undefined reference
// (not OHOS and MAC) ERRCHECK: %compiler %cmp_opt %pkg_compile pkg/pkg.cj -o libpkg.%test_suffix
// (not OHOS and MAC) ASSERT: scan undefined symbol
// (not CJNATIVE and not Windows) EXEC: %compiler %cmp_opt %pkg_compile pkg/pkg.cj -o libpkg.cbc
// (not CJNATIVE and not Windows) EXEC: %compiler %cmp_opt %f libpkg.pdba -o %output
// (not CJNATIVE and not Windows) RUN-ERRCHECK: %set LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH && %run --cbc-path . %output %run_args
// (not CJNATIVE and not Windows) ASSERT: scan Unsatisfied link: pkg.testfunc

import pkg.*

unsafe main(): Int64 {
    var result: Int8 = newtestfunc(1, 2)
    if (result == 3) {
        print("pass\n")
    }
    return 0
}
// (not Windows) ASSERT: regex-not no position error occurred
