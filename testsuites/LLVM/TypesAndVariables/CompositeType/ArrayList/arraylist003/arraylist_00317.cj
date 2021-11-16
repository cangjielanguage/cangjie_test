// DEPENDENCE: 314.cj  314.cfg
// EXEC: %compiler %cmp_opt -c 314.cj -o test314.%middle
// EXEC: %compiler %cmp_opt  %f test314.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test314.*

func main(): Int64 {
    func x(a:Int64):test314.E{test314.E.e(1)}
    var i : Int64 = 10
    var myArray : ArrayList<test314.E> = ArrayList<test314.E>(i,x)
    return 0
}
