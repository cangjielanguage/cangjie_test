// DEPENDENCE: ../../src ../../cfg-ast
// EXEC: %compiler -g %cmp_opt -c src/pkgs1/pkg1.cj  -o pkgs1.%middle
// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f
package pkgs2
external import pkgs1.*

external var varpkg2: Int64 = 20

external func funpkg2(): Int64 {
    var a: Int64 = 20
    var b: Int64 = 20
    return a + b
}

// ASSERT:scan  10: newobj pkgs2.funpkg2
// ASSERT:scan  12: return.64

