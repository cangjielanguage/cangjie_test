// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.foo // Shadow
import p2.foo // Shadow

func foo(a: UInt64) { return 5 } // f5
func main(): Int64 {
    var a1 = foo(Int64(1))
    if ( a1 != 4 ){
        return 1
    }
    return 0
}