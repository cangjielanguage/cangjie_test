// DEPENDENCE: ../../mod1
// EXEC-PIPE-1: %compiler %cmp_opt %mod_opt ./mod1 -o ./ 2>&1 | compare %f
// ASSERT: scan package name supposed to be 'p1'

package d
import p123.*
import p2.a2 as a
func main(): Int64 {
    var a = a1
    var b = a
    return 0
}
