// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

package p0
import p1.foo
import p2.foo

func main(): Int64 {
    var a1 = p1.foo(Int8(1))
    var a2 = p1.foo(Int16(1))
    var a3 = p1.foo(Int32(1))
    var a4 = p1.foo(Int64(1))
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
    return 0
}