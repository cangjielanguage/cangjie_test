// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj anno31_cjnative.expect 
// EXEC: %compiler %cmp_macro define.cj
// EXEC-1: %compiler %cmp_opt %f -o %output > %n.txt  2>&1
// (CJNATIVE) EXEC: %diff anno31_cjnative.expect %n.txt


import define.*

@MtoStruct2
class C {}

main() {}
