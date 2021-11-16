// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/*.cj  pkga.%middle -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*,pkgb.*

func main(): Int64 {
    if ( b1 != 1 || b2 != 1 ){
        return 1
    }
    return 0
}