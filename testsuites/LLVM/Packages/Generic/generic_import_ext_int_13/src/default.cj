// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.foo

func main(): Int64 {
    var a = p1.foo<Int32>(1)
    if ( a != 1 ){
        return 1
    }
    return 0
}
