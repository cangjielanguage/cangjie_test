// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

package p4
import p1.C// OK
import p2.C// OK

func main() {
    let b = p1.C() // OK, class C in package p1 is used.
    let c = p2.C() // OK, class C in package p2 is used.
    if ( b.c12 != 1 ){
        return 1
    }
    if ( c.c22 != 2 ){
        return 2
    }
    return 0
}