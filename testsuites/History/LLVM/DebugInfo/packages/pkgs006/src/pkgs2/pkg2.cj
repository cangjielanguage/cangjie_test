// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

package pkgs2

external var varpkg2: Int64 = 20



// ASSERT:scan  5: ststatic.64 pkgs2

