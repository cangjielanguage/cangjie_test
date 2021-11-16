// DEPENDENCE: ../p1
// EXEC-PIPE-1: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle 2>&1| compare %f
// ASSERT: regex error.*external declaration uses internal types

package p0
import p1.foo

func main(): Int64 {
    return 0
}
