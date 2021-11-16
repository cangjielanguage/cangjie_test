// DEPENDENCE: ../../mod1
// EXEC: %compiler %cmp_opt %mod_opt ./mod1 -o ./ 2>&1 | compare %f
package d
import p1.*

func main(a:List<Int64>){ //EXPECTED:regex error.*?entry function 'main' cannot be defined with parameters or with parameter whose type is not List<String>
    var a = a1
    var b = a
    0
}