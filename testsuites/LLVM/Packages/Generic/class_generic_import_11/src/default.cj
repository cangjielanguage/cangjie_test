// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.*

func main(): Int64 {
    var r1 : A<Int32>  = A<Int32>()
    if ( r1.a != 1 ){
        return 1
    }
    var r2 : B<Int32>  = B<Int32>()
    if ( B<Int32>.a != 1 ){
        return 1
    }
    var r3 : C<Int32> = C<Int32>(1)

    var r4 : D<Int32>  = D<Int32>()

    var r5 : E<Int32>  = E<Int32>()

    return 0

}
