// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f


package pkgs1.pkgs101


external func fun101(): Int64 {
    var a: Int64 = 10
    var b: Int64 = 10
    return a + b
}

// ASSERT:scan  8: newobj pkgs1/pkgs101
// ASSERT:scan  9: movi
// ASSERT:scan  10: return.64