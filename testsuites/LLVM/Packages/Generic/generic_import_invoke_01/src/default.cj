// DEPENDENCE: p1 p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.foo
import p1.goo
import p2.*

func main(): Int64 {
    var a = p1.foo<Int8>(1)
    var b = goo<Int8>(1)
    var c = p2.foo<Int8>(1)
    var d = hoo<Int8>(1)
    if ( a != 1 ){
        return 1
    }
    if ( b != 1 ){
        return 1
    }
    if ( c != 1 ){
        return 1
    }
    if ( d != 1 ){
        return 1
    }
    return 0
}
