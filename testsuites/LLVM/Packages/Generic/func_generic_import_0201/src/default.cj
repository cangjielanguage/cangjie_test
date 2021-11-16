// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle %f -o %output 2>&1 | compare %f

import p1.aoo
import p1.boo as B

func main(): Int64 {
    var r1 = aoo // EXPECTED: regex error.*generic type should be used with type argument
    var r2 = B<Int32> // EXPECTED: regex error.*type argument's number does not match type parameter's number
    return 0
}

