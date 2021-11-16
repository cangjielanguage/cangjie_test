// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/*.cj  pkga.%middle -o pkgb.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output 2>&1 | compare %f

import pkgb.b1 as alias1,pkgb.b2 as alias2

func main(): Int64 {
    if ( pkgb.b1 != 1 ){ // EXPECTED: regex error.*'b1' is not a member of package 'pkgb'
        return 1
    }
    if ( b2 != 1 ){ // EXPECTED: regex error.*undeclared identifier 'b2'
        return 2
    }
    return 0
}