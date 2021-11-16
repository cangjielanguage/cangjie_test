// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

package pkgs1

external var varpkg1: Int64 = 10




// ASSERT:scan  5: ststatic.64 pkgs1.
