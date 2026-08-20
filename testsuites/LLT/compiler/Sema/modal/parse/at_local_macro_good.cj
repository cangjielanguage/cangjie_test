// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Macro named 'local' with space after '@': macro decl modifier, not type modal.

// DEPENDENCE: %n.macro.cj
// EXEC: %compiler %cmp_macro %n.macro.cj
// EXEC: %compiler %f -Woff all

import modal_parse_macro.*


main() {
    @local @local! func foo() {}
}
