// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/*.cj  pkga.%middle -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgb.b1 as alias1,pkgb.b2 as alias2

func main(): Int64 {
    if ( alias1 != 1 || alias2 != 1 ){
        return 1
    }
    return 0
}
