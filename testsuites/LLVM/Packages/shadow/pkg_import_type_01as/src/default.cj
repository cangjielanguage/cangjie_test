// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/*.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.a as alias1 ,pkgb.* as alias2.*

func main(): Int64 {
    if ( alias1 != 1 ){
        return 1
    }
    if ( alias2.b1 != 1 ){
        return 2
    }
    if ( alias2.b2 != 2 ){
        return 3
    }
    return 0
}
