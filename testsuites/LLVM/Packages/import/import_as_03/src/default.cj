// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c p1/a.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f a.%middle -o %output 2>&1 | compare %f

import p1.* as aoo // EXPECTED: regex error.*when setting alias for imported package, it should be 'as alias.*'

func main(): Int64 {
    return 0
}