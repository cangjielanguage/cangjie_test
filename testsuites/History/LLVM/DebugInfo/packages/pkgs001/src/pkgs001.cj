// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g src/pkgs/pkg1.cj
// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

import pkgs.varpkg1_001
import pkgs.funpkg1001 as f1

let test: Int8 = pkgs.varpkg1_001
internal var test1: Int8 = 1

func funpkg1001(): Int8 {
    var a: Int8 = 20
    var b: Int8 = 20
    return a + b
}

func run(): Int64 {
    var res1: Int8 = pkgs.varpkg1_001
    var res2: Int8 = f1()
    var res3: Int8 = funpkg1001()
    if (  res3 >= res2) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    var res11: Int8 = pkgs.varpkg1_001
    var res22: Int8 = f1()
    var res33: Int8 = 10
    return run()
}

// ASSERT:scan  29:
// ASSERT:scan  30: call pkgs.funpkg1001
// ASSERT:scan  32: call default.run
// ASSERT:scan  18: newobj default.
// ASSERT:scan  19: call pkgs.funpkg1001
// ASSERT:scan  20: call default.funpkg1001