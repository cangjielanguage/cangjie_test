// DEPENDENCE: ../src ../cfg-ast ../cfg-ast1
// EXEC: %compiler -g %cmp_opt -c src/pkgs1/pkg1.cj  -o pkgs1.%middle
// EXEC: %compiler -g %cmp_opt src/pkgs2/pkg2.cj -import-config cfg-ast1 pkgs1.%middle  -o pkgs2.%middle
// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

import pkgs2.*

let test1: Int64 = varpkg1
let test2: Int64 = varpkg2

func run(): Int64 {
    var res1: Int64 = funpkg1() //20
    var res2: Int64 = funpkg2() //40
    if (  res1 + res2 ==  60) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}

// ASSERT:scan  22: call default.run
// ASSERT:scan  12: call pkgs1.funpkg1
// ASSERT:scan  13: call pkgs2.funpkg2
