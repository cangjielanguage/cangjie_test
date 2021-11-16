// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle %f -o %output 2>&1 | compare %f

import p1.aoo
import p1.boo as B
import p1.A

func main(): Int64 {
    var r1 = aoo<Int64> // EXPECTED: regex error.*generics type arguments do not match the constraint
    return 0
}