// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/*.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.* as alias.*

func main(): Int64 {
    var m1 = alias.a
    func alias(){ return 2 }
    alias()
    if ( m1 != 1 ){
        return 1
    }
    if ( alias() != 2 ){
        return 2
    }
    return 0
}