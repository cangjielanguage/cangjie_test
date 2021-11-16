// DEPENDENCE: p1 p2
// EXEC: %compiler %cmp_opt -c p1/file1.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c p2/*.cj  p1.%middle -o p2.%middle
// EXEC: %compiler %cmp_opt %f p1.%middle p2.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import p1.*
import p2.*

func main(): Int64 {
    if ( result1 != 1 ){
        return 1
    }
    if ( result2 != 1 ){
        return 1
    }
    return 0
}
