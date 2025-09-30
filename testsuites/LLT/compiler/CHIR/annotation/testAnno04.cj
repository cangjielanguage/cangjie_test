// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %debugCHIROpt %n.cj -o %output | compare %f
// ASSERT: scan The annotation factory function of Weekday1

@Annotation
public class Anno {
    public const init() {}
}

@Anno
public enum Weekday1 {
    | A
}

main() {
    0
}