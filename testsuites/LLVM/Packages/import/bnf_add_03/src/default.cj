// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c p1/a.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f a.%middle -o %output 2>&1 | compare %f

import p1. // EXPECTED: regex error.*it doesn't support importing package by package name.

func main(): Int64 {
    return 0
}