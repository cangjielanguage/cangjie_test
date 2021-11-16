// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle %f -o %output 2>&1 | compare %f

import p1.A,p1.a,p1.b

func main(): Int64 {
    a.b = 3 // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    b.b = 3 // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    return 0
}

