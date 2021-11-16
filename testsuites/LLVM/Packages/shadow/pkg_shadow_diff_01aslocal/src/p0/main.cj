// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC-PIPE-1: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output 2>&1 | compare %f

package p0
import p1.foo as goo // EXPECTED: regex-auto redefinition of declaration 'goo' 
var goo = 21

func main(): Int64 {
    var a1 = goo // EXPECTED: regex-auto redefinition of declaration 'goo'
    return 0
}
