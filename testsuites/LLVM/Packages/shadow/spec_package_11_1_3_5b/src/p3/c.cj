// DEPENDENCE: ../p1 ../p2 ../p3
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

package p3
import p2.f

func main(): Int64 {
    let obj = f() // OK
    if ( obj.c != 1 ){
        return 1
    }
    return 0
}
