// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o b.%middle
// EXEC: %compiler %cmp_opt a.%middle b.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

package p3
import p1.*
import p2.*

func main() {
    let b = p1.C() // OK, class C in package p1 is used.
    let c = p2.C() // OK, class C in package p1 is used.
    if ( b.c12 != 1 ){
        return 1
    }
    if ( c.c22 != 2 ){
        return 2
    }
    return 0
}