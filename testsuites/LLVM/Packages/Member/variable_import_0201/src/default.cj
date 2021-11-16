// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c p1/a.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f a.%middle -o %output 2>&1 | compare %f

import p1.a

func main(): Int64 {
    a ++ // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    p1.a = 3 // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    return 0
}
