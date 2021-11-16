// DEPENDENCE: 401.cj  401.cfg
// EXEC: %compiler %cmp_opt -c 401.cj -o 401.%middle
// EXEC: %compiler %cmp_opt  %f 401.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test401.*

func main(): Int64 {
    var myList : List<Array<test401.X>> = [[test401.X()].toArray()]
    return 0
}
