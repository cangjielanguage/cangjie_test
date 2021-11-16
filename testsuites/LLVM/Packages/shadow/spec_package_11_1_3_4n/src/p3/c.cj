// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o b.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle b.%middle %f -o %output 2>&1 | compare %f

//DTS202107120HDZX5P1F00
package p3
import p1.*
import p2.*

func main() {
    let a = C() // EXPECTED: regex error.*can not distinguish which class C is used
    return 0
}