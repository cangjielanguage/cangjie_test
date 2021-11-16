// DEPENDENCE: a.cj a.cfg
// EXEC: %compiler %cmp_opt -c a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f -import-config a.cfg a.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package pkg13002

import a.*

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : B<Int32> = B<Int32>()
    var c : C<Int32> = D<Int32>()
    if (!(a*a)) {
        return 1
    }
    if (!(b*b)) {
        return 2
    }
    if (!(c*c)) {
        return 3
    }
    return 0
}
