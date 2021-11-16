// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle %f -o %output 2>&1 | compare %f

import p1.foo<V> // EXPECTED: regex error.*expected newline or ';' after importspec

func main(): Int64 {
    return 0
}