// DEPENDENCE: ../../mod1
// EXEC: %compiler %cmp_opt %mod_opt ./mod1/ -o ./ 2>&1 | compare %f
// ASSERT: scan entry function 'main' is missin

import p1.foo
func goo(): Int64 {
    var a = foo(Int8(1))
    if ( a != 11 ) {
        return 1
    }
    return 0
}