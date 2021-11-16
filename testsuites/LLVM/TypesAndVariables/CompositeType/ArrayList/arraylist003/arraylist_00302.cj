// DEPENDENCE: 301.cj  301.cfg
// EXEC: %compiler %cmp_opt -c 301.cj -o test301.%middle
// EXEC: %compiler %cmp_opt %f test301.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test301.*

record A<T>{}

func main(): Int64 {
    func x(a:Int64):A<test301.X>{A<test301.X>()}
    var i : Int64 = 10
    var myArray : ArrayList<A<test301.X>> = ArrayList<A<test301.X>>(i,x)
    return 0
}
