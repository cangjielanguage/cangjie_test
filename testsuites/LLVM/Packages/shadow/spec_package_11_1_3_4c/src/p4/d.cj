// DEPENDENCE: ../p1 ../p2 ../p3
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt -c ./p3/*.cj -o p3.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle p3.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.foo // Shadow
import p2.foo // Shadow
import p3.foo // Shadow

func foo(a: UInt64) { return 5 } // f5
func main(): Int64 {
    let a: Int32 = 1
    if ( p2.foo(a) != 3 ){
        return 1
    }
    if ( foo(a) != 3 ){ // overloading resolution is made in collection {f1, f2, f3, f4, f5}
        return 2
    }
    if ( foo(UInt64(1)) != 5 ){
        return 3
    }
    if ( foo(Int16(1)) != 2 ){
        return 4
    }
    return 0
}