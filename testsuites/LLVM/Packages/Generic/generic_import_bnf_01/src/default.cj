// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.foo
import p1.goo as A

func main(): Int64 {
    var a = foo<Int8>(1)
    var b = A<Int8>(1)
    if ( a != 1 ){
        return 1
    }
    if ( b != 1 ){
        return 1
    }
    return 0
}
