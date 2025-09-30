// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %debugCHIROpt %n.cj -o %output | compare %f
// ASSERT: scan The annotation factory function of v123

@Annotation
public class A1 {
    public let v: Int64
    public const init(p0: Int64) {
        this.v = p0
    }
}

public class C0 {
    @A1[12]
    public static var v123: Int64 = 12
}

main() {
    0
}