// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/*.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

//DTS202107080I3TAQP1J00
import pkga.* as alias1.*
import pkgb.b1 as alias2
import pkgb.*

func main(): Int64 {
    if ( alias1.a != 1 ){
        return 1
    }
    if ( a != 1 ){
        return 2
    }
    if ( alias2 != 1 ){
        return 3
    }
    if ( pkgb.b1 != 1 ){
        return 4
    }
    if ( b1 != 1 ){
        return 5
    }
    if ( b2 != 2 ){
        return 6
    }
    return 0
}
