// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f
package pkgs

external var varpkg1_001: Int8 = 127
internal var varpkg1_002: Int8 = 1

external func funpkg1001(): Int8 {
    var a: Int8 = 10
    var b: Int8 = 20
    return a + b
}

// ASSERT:scan  8: newobj pkgs.funpkg1001
// ASSERT:scan  10: jmp label.0

