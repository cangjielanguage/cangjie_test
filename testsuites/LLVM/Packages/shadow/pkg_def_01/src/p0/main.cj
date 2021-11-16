// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output 2>&1 | compare %f

import p1.foo
import p2.foo
package p0  // EXPECTED: regex error.*illegal object in toplevel, toplevel must consist of declaration or definition

func main(): Int64 {
    return 0
}