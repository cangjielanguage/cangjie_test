// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c p1/a.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %f p1.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import p1.a as aoo
import p1.b

func main(): Int64 {
    if ( p1.b != 2 ){
        return 1
    }
    if ( aoo != 1 ){
        return 1
    }
    if ( b != 2 ){
        return 1
    }
    return 0
}
