// DEPENDENCE: pkg1.cj pkg2.cj
// EXEC: %compiler %cmp_opt pkg1.cj -c -backend-options="-fPIC" -o pkg1.%middle
// EXEC: %compiler %cmp_opt pkg2.cj ./pkg1.%middle -c -backend-options="-fPIC" -o pkg2.%middle
// EXEC: %compiler %cmp_opt %n.cj pkg1.%middle pkg2.%middle %use_ast -o %output
// EXEC: %run %run_opt %output

package p3

import macro pkg1.*
import macro pkg2.*

func main(){
    var res1 = @Foo1(1 + 2)
    var res2 = @Foo2[2 + ](1)
    var res3 = @M(1 + 2)

    if (res1 == 3 && res2 == 3 && res3 == 3) {
        return 0
    }
    return 1
}