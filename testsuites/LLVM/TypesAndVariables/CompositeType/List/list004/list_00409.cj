// DEPENDENCE: 401.cj  401.cfg
// EXEC: %compiler %cmp_opt -c 401.cj -o 401.%middle
// EXEC: %compiler %cmp_opt  %f 401.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test401.*

type mytype = test401.X

func main(): Int64 {
    var myList : List<mytype> = [mytype()]
    return 0
}
