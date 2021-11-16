// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o b.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle b.%middle %f -o %output 2>&1 | compare %f

package p0
import p1.foo as goo // EXPECTED: regex alias name 'goo' is conflicted with imported declaration name
import p2.foo as goo // EXPECTED: regex alias name 'goo' is conflicted with imported declaration name

func main(): Int64 {
    var a = goo
    return 0
}
