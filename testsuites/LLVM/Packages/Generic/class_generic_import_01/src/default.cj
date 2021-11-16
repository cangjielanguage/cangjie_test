// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.A
import p1.A2 as Aoo
import p1.A3

func main(): Int64 {
    var a : A<Int32>  = A<Int32>(1)
    if ( a.a != 1 ){
        return 1
    }
    var b : Aoo<Int32>  = Aoo<Int32>(1)
    if ( b.b != 1 ){
        return 1
    }
    var c : p1.A3<Int32>  = A3<Int32>(1)
    if ( c.c != 1 ){
        return 1
    }
    return 0
}
