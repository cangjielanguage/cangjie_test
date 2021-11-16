// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle %f -o %output 2>&1 | compare %f

import p1.*

func main(): Int64 {
    var a = p1.foo<Int32>(1) // EXPECTED: regex error.*'foo' is not a member of package 'p1'
    var b = foo<Int32>(1) // EXPECTED: regex error.*undeclared identifier 'foo'
    return 0
}