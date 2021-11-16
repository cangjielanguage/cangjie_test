// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC-PIPE-1: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package p3

import p2.f

external import p1.C2 // EXPECTED:regex error.*?redefinition of declaration 'C2'
external import p2.C2 // EXPECTED:regex error.*?redefinition of declaration 'C2'
class C2{} // EXPECTED:regex error.*?redefinition of declaration 'C2'
func main(): Int64 {
    let obj1 = f() // OK.
    let obj2: C1 = f() // OK, class C1 is visible to current package.
    return 0
}