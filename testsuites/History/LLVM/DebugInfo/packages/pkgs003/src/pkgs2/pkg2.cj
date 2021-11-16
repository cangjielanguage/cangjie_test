// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f


package pkgs2

external var varpkg1_001: Int64 = 20

external func funpkg1001(): Int64 {
    var a: Int64 = 20
    var b: Int64 = 20
    return a + b
}

// ASSERT:scan  9: newobj pkgs2.funpkg1001
// ASSERT:scan  11: return.64