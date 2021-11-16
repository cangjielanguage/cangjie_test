// DEPENDENCE: ../mod1
// EXEC: %compiler %cmp_opt -c ./mod1/src/p1/*.cj -module-name mod1 -o mod1/a.%middle  && %copycharjs mod1
// EXEC: %compiler %cmp_opt mod1/a.%middle  %f -o %output
// EXEC: %run %run_opt %output %run_args

from mod1 import p1.a as aoo
from mod1 import p1.b

func main(): Int64 {
    if ( aoo != 1 ){
        return 1
    }
    if ( mod1.p1.b != 2 ){
        return 1
    }
    if ( p1.b != 2 ){
        return 1
    }
    if ( b != 2 ){
        return 1
    }
    return 0
}