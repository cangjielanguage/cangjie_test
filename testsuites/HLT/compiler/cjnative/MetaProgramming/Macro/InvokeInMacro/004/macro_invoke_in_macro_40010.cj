/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_a_40010.cj define_b_40010.cj define_aa_40010.cj
// (CJNATIVE) EXEC: %compiler define_a_40010.cj define_aa_40010.cj %cmp_macro
// (CJNATIVE) EXEC: %compiler define_b_40010.cj %cmp_macro
// (CJNATIVE) EXEC: %compiler %cmp_opt  %f -o %output

// (not CJNATIVE) EXEC: %compiler define_a_40010.cj define_aa_40010.cj %macro_opt
// (not CJNATIVE) EXEC: %compiler define_b_40010.cj %macro_opt
// (not CJNATIVE) EXEC: %compiler %cmp_opt  %f -o %output

// RUN-EXEC: %run %run_opt %output %run_args

package use

import B.*

main() {
    return @b[1](0)
}
