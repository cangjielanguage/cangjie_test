// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f


package pkgs1

external var varpkg1_001: Int64 = 10

external func funpkg1001(): Int64 {
    var a: Int64 = 10
    var b: Int64 = 10
    return a + b
}


// ASSERT:scan  9: newobj pkgs1.funpkg1001
// ASSERT:scan  11: return.64
