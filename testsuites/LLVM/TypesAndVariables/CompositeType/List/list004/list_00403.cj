// DEPENDENCE: 401.cj  401.cfg
// EXEC: %compiler %cmp_opt -c 401.cj -o 401.%middle
// EXEC: %compiler %cmp_opt  %f 401.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test401.*

class A<T>{}

func main(): Int64 {
    var myList : List<A<test401.X>> = [A<test401.X>()]
    return 0
}
