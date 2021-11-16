// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f


package pkgs1

external func foo(a: Int64) {
    return a
}   // f1
external func foo(a: Int8) {
    return a
}  // f2

// ASSERT:scan  7: newobj pkgs1.foo
// ASSERT:scan  10: newobj pkgs1.foo
