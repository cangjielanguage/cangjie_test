// DEPENDENCE: 401.cj  401.cfg
// EXEC: %compiler %cmp_opt -c 401.cj -o 401.%middle
// EXEC: %compiler %cmp_opt  %f 401.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test401.*

func y<T>(a:T):T{a}
func x<T>(a:Int64):(T)->T{y<T>}

func main(): Int64 {
    var myList : List<(test401.X)->test401.X> = [y<test401.X>]
    return 0
}
