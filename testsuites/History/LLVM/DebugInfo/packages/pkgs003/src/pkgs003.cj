// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler -g %mod_opt . %cmp_opt
// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f


import pkgs1.varpkg1_001, pkgs2.varpkg1_001
import pkgs1.funpkg1001 as f1, pkgs2.funpkg1001 as f2

let test1: Int64 = pkgs1.varpkg1_001
let test2: Int64 = pkgs2.varpkg1_001

func run(): Int64 {
    var res1: Int64 = f1() //20
    var res2: Int64 = f2() //40
    if (  res1 + res2 ==  60) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}

// ASSERT:scan  23: call default.run
// ASSERT:scan  13: newobj default.run
// ASSERT:scan  13: call pkgs1.funpkg1001
// ASSERT:scan  14: call pkgs2.funpkg1001