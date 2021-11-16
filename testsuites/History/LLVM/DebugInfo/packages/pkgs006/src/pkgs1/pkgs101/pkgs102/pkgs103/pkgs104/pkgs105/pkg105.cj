// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f


package pkgs1.pkgs101.pkgs102.pkgs103.pkgs104.pkgs105

external func fun105(a: Int32): Int32 {
     if (a == 0) {
         return 0
     } else {
         return a + fun105(a-1)
     }
 }


// ASSERT:scan  7: newobj pkgs1/pkgs101/pkgs102/pkgs103/pkgs104/pkgs105
// ASSERT:scan  7: jeqz label.2
// ASSERT:scan  10: call pkgs1/pkgs101/pkgs102/pkgs103/pkgs104/pkgs105
// ASSERT:scan-not  9:

