// DEPENDENCE: 410.cj  410.cfg
// EXEC: %compiler %cmp_opt -c 410.cj -o 410.%middle
// EXEC: %compiler %cmp_opt  %f 410.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test410.*

func main(): Int64 {
    var myList : List<test410.E<Int64>> = [test410.E<Int64>.e(1)]
    return 0
}
