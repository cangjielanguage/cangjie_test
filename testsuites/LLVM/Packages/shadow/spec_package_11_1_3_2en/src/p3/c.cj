// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj p1.%middle -o p2.%middle
// EXEC-PIPE-1: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output 2>&1 | compare %f

package p3
import p2.foo // EXPECTED: regex error.*'foo' is not accessible in package 'p2'

func main() {
    foo() // EXPECTED: regex error.*undeclared identifier 'foo'
    return 0
}