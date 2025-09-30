/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (CJNATIVE and not arm and not OHOS) EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE and not arm and not OHOS) RUN-EXEC: %run %run_opt %output %run_args

// (not CJNATIVE or arm or OHOS) ERRCHECK: %compiler %cmp_opt %f -o %output
// (not CJNATIVE or arm or OHOS) ASSERT: scan sema_undeclared_identifier

@When[backend == "cjnative" && arch != "aarch64"]
func test() {
    return 0
}

main() {
    return test()
}
