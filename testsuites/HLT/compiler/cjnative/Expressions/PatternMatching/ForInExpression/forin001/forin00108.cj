/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f

func test(): Int64 {
    let myList: Array<Int32> = [0,1,2]
    for (i in myList where (@)) {
        return 0
        i = i + 1
    return 1
}

main(): Int64 {
    return test()
}
// ASSERT: scan parse_expected_expression
// ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_expected_right_delimiter
