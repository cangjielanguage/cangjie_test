// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c p1/a.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f a.%middle -o %output 2>&1 | compare %f

import p1.a
import p1.a as aoo

func main(): Int64 {
    if ( a != 1 ){ // EXPECTED: regex error.*undeclared identifier 'a'
        return 1
    }
    if ( aoo != 1 ){ // EXPECTED: regex-not error
        return 1
    }
    if ( p1.a != 1 ){ // EXPECTED: regex error.*'a' is not a member of package 'p1'
        return 1
    }
    return 0
}