// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f


package pkgs

external var varpkg1_001: Int16 = 1
external var varpkg1_002: Int32 = 1
external var varpkg1_003: Int64 = 1
external var varpkg1_004: UInt8 = 1
external var varpkg1_005: UInt16 = 1
external var varpkg1_006: UInt32 = 1
external var varpkg1_007: UInt64 = 1


// ASSERT:scan  6: ststatic pkgs.
// ASSERT:scan  12: ststatic.64 pkgs.



