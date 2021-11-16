// DEPENDENCE: ../mod1
// EXEC-PIPE-1: %compiler %cmp_opt %mod_opt ./mod1 -o ./ 2>&1 | compare %f
// ASSERT: regex error.*can not found src dir under the modulepath of './mod1'

package d
import p1.*
import p2.a2 as a
func main(): Int64 {
    var a = a1
    var b = a
    return 0
}