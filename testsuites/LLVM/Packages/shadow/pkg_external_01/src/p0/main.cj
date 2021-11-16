// DEPENDENCE: ../p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

package p0
import p1.a

func main(): Int64 {
    var r1 = a
    if ( r1 != 1 ) {
        return 1
    }
    return 0
}