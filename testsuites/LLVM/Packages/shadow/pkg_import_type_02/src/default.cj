// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/*.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*,pkgb.*

func main(): Int64 {
    if ( a() != 1 ){
        return 1
    }
    if ( b1() != 2 ){
        return 2
    }
    if ( pkgb.b2() != 2 ){
        return 3
    }
    return 0
}