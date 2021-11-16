// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f


package pkgs1.pkgs101.pkgs102

external func fun102(a: Int32, b: Int32): Int32 {
    if (a >= b) {
        return a
    } else {
        return b
    }
}

// ASSERT:scan  7: newobj pkgs1/pkgs101/pkgs102
// ASSERT:scan  10: jgez label.2
// ASSERT:scan  8: label.2