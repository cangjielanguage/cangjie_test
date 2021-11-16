// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f


package pkgs1.pkgs101.pkgs102.pkgs103.pkgs104


external func fun104(a: Int32, b!: Int32 = 1): Int32 {
    var a1: Int32
    a1 = a
    var b1: Int32 = b
    return a1 + b1
}


// ASSERT:scan  9: newobj pkgs1/pkgs101/pkgs102/pkgs103/pkgs104
// ASSERT:scan  10: mov
// ASSERT:scan  11: return
// ASSERT:scan-not  8: