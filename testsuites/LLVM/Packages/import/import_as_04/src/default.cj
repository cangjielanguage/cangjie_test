// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c p1/a.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %f p1.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import p1.* as aoo.*

func main(): Int64 {
    if ( aoo.a != 1 ){
        return 1
    }
    return 0
}
