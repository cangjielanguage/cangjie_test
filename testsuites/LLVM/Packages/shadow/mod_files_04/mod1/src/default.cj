// DEPENDENCE: ../../mod1
// EXEC: %compiler %cmp_opt %mod_opt ./mod1 -o ./
// EXEC: %run_pkg %run_opt %main %run_args

package d
import p1.*
import p2.a2 as a
func main(): Int64 {
    var a = a1
    var b = a
    return 0
}
