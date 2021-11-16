// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj p1.%middle -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

package p3
import p2.foo2

func main() {
    if ( foo2() != 1 ){
        return 1
    }
    return 0
}