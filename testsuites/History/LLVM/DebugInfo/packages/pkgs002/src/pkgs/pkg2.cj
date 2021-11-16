// EXEC:%compiler %cmp_opt %dumpCHILDebug -g  %n.cj  -o %output | compare %f

package pkgs

external var varpkg2_001: Float16 = 0.001
external var varpkg2_002: Float32 = 0.001
external var varpkg2_003: Float64 = 1.00
external var varpkg2_004: Unit = ()
external var varpkg2_005: Bool = true
external var varpkg2_006: Char = '5'


// ASSERT:scan  5: ststatic.64 pkgs.
// ASSERT:scan  10: ststatic pkgs.