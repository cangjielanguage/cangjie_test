// DEPENDENCE: 301.cj  301.cfg
// EXEC: %compiler %cmp_opt -c 301.cj -o test301.%middle
// EXEC: %compiler %cmp_opt %f test301.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test301.*

func main(): Int64 {
    //func x(a:Int64):Array<test301.X>{[test301.X()].toArray()}
    func x(a:Int64):Array<test301.X>{@{test301.X()}}
    var i : Int64 = 10
    var myArray : ArrayList<Array<test301.X>> = ArrayList<Array<test301.X>>(i,x)
    return 0
}
