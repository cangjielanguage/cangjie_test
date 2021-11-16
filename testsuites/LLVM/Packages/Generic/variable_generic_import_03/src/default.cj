// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.A,p1.a,p1.b

func main(): Int64 {
    var r1 = { a.a }
    var r2 = { a.b }
    var r3 = { b.a }
    var r4 = { b.b }
    if ( r1() != 1 ){
        return 1
    }
    if ( r2() != 1 ){
        return 2
    }
    if ( r3() != 2 ){
        return 3
    }
    if ( r4() != 2 ){
        return 4
    }
    return 0
}

