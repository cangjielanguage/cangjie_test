// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c p1/a.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %f p1.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import p1.a

func main(): Int64 {
    a ++
    if ( a != 2 ){
        return 2
    }
    p1.a = 3
    if ( a != 3 ){
        return 3
    }
    return 0
}
