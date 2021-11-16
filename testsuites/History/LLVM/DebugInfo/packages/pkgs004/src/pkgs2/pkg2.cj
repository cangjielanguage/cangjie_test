// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f


package pkgs2

external func foo(a: Int16) {
    return a
}  // f3
external func foo(a: Int64) {
    return a
}  // f4


// ASSERT:scan  7: newobj pkgs2.foo
// ASSERT:scan  10: newobj pkgs2.foo

