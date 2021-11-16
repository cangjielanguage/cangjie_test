// DEPENDENCE: 1108.cj  1108.cfg
// EXEC: %compiler %cmp_opt -c 1108.cj -o 1108.%middle
// EXEC: %compiler %cmp_opt %f 1108.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test1108.*

func main(): Int64 {
    var i : Int64 = 0
    return test1108.a[i] - 1
}
