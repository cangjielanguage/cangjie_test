// DEPENDENCE: ../../mod1
// EXEC: %compiler %cmp_opt %mod_opt ./mod1/ -o ./ 2>&1 | compare %f
// ASSERT: regex warning.*function 'main' which doesn't belong to source file under src path will not be treated as entry function

import p1.foo
func main(): Int64 {
    var a = foo(Int8(1))
    if ( a != 11 ) {
        return 1
    }
    return 0
}