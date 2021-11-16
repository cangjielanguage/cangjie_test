// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

package p0
import p1.foo
import p2.foo

var foo = 1
func main(): Int64 {
    var a1 = p0.foo
    var a2 = foo
    var a3 = p1.foo
    var a4 = p2.foo
    if ( a1 != 1 ){
        return 1
    }
    if ( a2 != 1 ){
        return 2
    }
    if ( a3 != 11 ){
        return 3
    }
    if ( a4 != 21 ){
        return 4
    }
    return 0
}