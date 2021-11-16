// DEPENDENCE: ../../mod1
// EXEC: %compiler %cmp_opt %mod_opt ./mod1/ -o ./ 2>&1 | compare %f
// ASSERT: regex error.*multiple entry functions 'main' are found in source files

import p1.foo
func main(): Int64 {
    var a = foo(Int8(1))
    if ( a != 11 ) {
        return 1
    }
    return 0
}

func main(a:List<String>): Int64 {
    var a = foo(Int8(1))
    if ( a != 11 ) {
        return 1
    }
    return 0
}