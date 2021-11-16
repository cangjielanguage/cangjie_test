// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler -g %mod_opt . %cmp_opt
// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

import pkgs.*

func main(): Int64 {
    var var001: Int16 = varpkg1_001
    var var002: Int32 = varpkg1_002
    var var003: Int64 = varpkg1_003
    var var004: UInt8 = varpkg1_004
    var var005: UInt16 = varpkg1_005
    var var006: UInt32 = varpkg1_006
    var var007: UInt64 = varpkg1_007

    var var2_001: Float16 = varpkg2_001
    var var2_002: Float32 = varpkg2_002
    var var2_003: Float64 = varpkg2_003
    var var2_004: Unit = varpkg2_004
    var var2_005: Bool = varpkg2_005
    var var2_006: Char = varpkg2_006
    return 1
}

// ASSERT:scan  8: ldstatic pkgs.varpkg1_001
// ASSERT:scan  14: ldstatic.64 pkgs.varpkg1_007
// ASSERT:scan  16: ldstatic.64 pkgs.varpkg2_001
// ASSERT:scan  21: ldstatic pkgs.varpkg2_006