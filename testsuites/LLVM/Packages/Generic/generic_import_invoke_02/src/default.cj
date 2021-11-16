// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle %f -o %output 2>&1 | compare %f

import p1.foo // EXPECTED: regex error.*'foo' is not accessible in package 'p1'

func main(): Int64 {
    return 0
}