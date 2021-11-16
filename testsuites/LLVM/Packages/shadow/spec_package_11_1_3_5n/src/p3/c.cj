// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output 2>&1 | compare %f

package p3
import p2.*

func main(): Int64 {
    var b = a // EXPECTED: regex error.*undeclared identifier 'a'
    return 0
}