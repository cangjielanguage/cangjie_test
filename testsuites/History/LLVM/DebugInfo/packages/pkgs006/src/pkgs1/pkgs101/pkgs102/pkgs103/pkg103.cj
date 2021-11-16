// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f


package pkgs1.pkgs101.pkgs102.pkgs103

external func fun103(a: Int16): Int16 {
    if (a >= 1) {
        return a
    } else {
        return 0
    }
}


// ASSERT:scan  7: newobj pkgs1/pkgs101/pkgs102/pkgs103
// ASSERT:scan  7: jgez label.2
// ASSERT:scan  8: label.2