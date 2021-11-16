// DEPENDENCE: ../p1 ../p2 ../p3
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

package p3
import p2.*

func main(): Int64 {
    var a1 = Int32(1).add(2) // OK, interface Num is re-exported by pkg2.
    var c = C() // OK, C is re-exported by pkg2.
    if ( a1 != 3 ){
        return 1
    }
    if ( c.c != 1 ){
        return 2
    }
    return 0
}