// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC-PIPE-1: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output 2>&1 | compare %f

//DTS202107120HDZX5P1F00
package p4
import p1.C// OK
import p2.C// OK

func main() {
    let a = C() // EXPECTED: regex error.*can not distinguish which class C is used
    return 0
}