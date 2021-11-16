// DEPENDENCE: ../../mod1
// EXEC: %compiler %cmp_opt %mod_opt ./mod1 -o ./
// EXEC: %run_pkg %run_opt %main %run_args

package d
import p1.*

func main(){
    var a = a1
    var b = a
    UIntNative(32) - b
}