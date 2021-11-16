// DEPENDENCE: 314.cj  314.cfg
// EXEC: %compiler %cmp_opt -c 314.cj -o test314.%middle
// EXEC: %compiler %cmp_opt  %f test314.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test314.*

func main(): Int64 {
    func x(a:Int64):test314.R{test314.R()}
    var i : Int64 = 10
    var myArray : ArrayList<test314.R> = ArrayList<test314.R>(i,x)
    return 0
}
