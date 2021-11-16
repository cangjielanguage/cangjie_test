// DEPENDENCE: 414.cj  414.cfg
// EXEC: %compiler %cmp_opt -c 414.cj -o 414.%middle
// EXEC: %compiler %cmp_opt  %f 414.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test414.*

func main(): Int64 {
    var myList : List<test414.E> = [test414.E.e(1)]
    return 0
}
