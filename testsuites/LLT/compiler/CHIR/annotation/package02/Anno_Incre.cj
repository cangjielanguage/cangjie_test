// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Darwin and DEBUG_OPTION) DEPENDENCE: %n.old.cj %n.new.cj
// (CJNATIVE and not Darwin and DEBUG_OPTION) EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// (CJNATIVE and not Darwin and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// (CJNATIVE and not Darwin and DEBUG_OPTION) EXEC: %rmfile %output
// (CJNATIVE and not Darwin and DEBUG_OPTION) EXEC: %rmfile %n.old.cj
// (CJNATIVE and not Darwin and DEBUG_OPTION) EXEC: %move %n.new.cj %n.old.cj
// (CJNATIVE and not Darwin and DEBUG_OPTION) EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output