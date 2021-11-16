// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler -g %cmp_opt -c src/pkgs1/pkg1.cj  -o pkgs1.%middle
// EXEC: %compiler -g %cmp_opt -c src/pkgs2/pkg2.cj  -o pkgs2.%middle
// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

import pkgs1.foo               // 遮盖
import pkgs2.foo              // 遮盖


func foo(a: Int64) {
    return a
}        // f5

func main() {
    let a: Int64 = 1
    let b: Int64 = pkgs1.foo(a)                 // 对于pkgs1中{f1, f2}进行重载决议.
    let c: Int64 = pkgs2.foo(a)                 // 对于pkgs2中{f3, f4}进行重载决议.
    let d: Int64 = foo(a)                      // 对于{f1, f2, f3, f4, f5}进行重载决议.
    return 1
}


// ASSERT:scan  15: label.0:
// ASSERT:scan  16: call pkgs1.foo:
// ASSERT:scan  17: call pkgs2.foo:
// ASSERT:scan  18: call default.foo:
