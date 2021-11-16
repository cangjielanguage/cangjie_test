// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

package p0
import p1.foo as goo
import p2.goo

func main(): Int64 {
    var a1 = goo(Int8(1))
    if ( a1 != 11 ){
        return 1
    }
    return 0
}
