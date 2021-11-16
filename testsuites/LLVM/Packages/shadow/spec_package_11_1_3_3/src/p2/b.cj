// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

package p2
import p1.*

func main() {
    var obj = C1()
    if ( obj.c2 != 2 ){
        return 1
    }
    if ( C1.c1 != 1 ){
        return 2
    }
    var result = foo()
    if ( result != 1 ){
        return 3
    }
    return 0
}