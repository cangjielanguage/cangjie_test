// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/*.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*,pkgb.*

func main(): Int64 {
    var m:()->Int64 = a
    var n = pkgb.b1
    var l = b2
    if ( m() != 1 ){
        return 1
    }
    if ( n() != 2 ){
        return 2
    }
    if ( l() != 2 ){
        return 3
    }
    return 0
}