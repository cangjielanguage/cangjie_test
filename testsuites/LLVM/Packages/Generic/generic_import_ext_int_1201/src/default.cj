// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle %f -o %output 2>&1 | compare %f

import p1.foo

func main(): Int64 {
    var a = p1.foo<Aoo>(Aoo(1)) // EXPECTED: regex error.*undeclared type name 'Aoo'
    if ( a.a != 1 ){
        return 1
    }
    return 0
}