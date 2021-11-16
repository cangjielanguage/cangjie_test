// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle %f -o %output 2>&1 | compare %f

import p1.boo as B

func main(): Int64 {
    var r2 = B<A,String> // EXPECTED: regex error.*undeclared type name 'A'
    return 0
}