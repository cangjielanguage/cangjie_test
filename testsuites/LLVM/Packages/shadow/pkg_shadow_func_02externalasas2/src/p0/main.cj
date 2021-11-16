// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

package p0
external import p1.foo
import p2.goo as foo

func main(): Int64 {
    var a1 = foo(Int8(1))
    var a2 = foo(Int16(1))
    var a3 = foo(Int32(1))
    var a4 = foo(Int64(1))
    var a5 = foo(UInt64(1))
    if ( a1 != 11 ){
        return 1
    }
    if ( a2 != 12 ){
        return 2
    }
    if ( a3 != 13 ){
        return 3
    }
    if ( a4 != 14 ){
        return 4
    }
    if ( a5 != 25 ){
        return 5
    }
    return 0
}