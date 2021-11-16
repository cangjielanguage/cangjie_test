// DEPENDENCE: 310.cj  310.cfg
// EXEC: %compiler %cmp_opt -c 310.cj -o test310.%middle
// EXEC: %compiler %cmp_opt  %f test310.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test310.*

func main(): Int64 {
    //func x(a:Int64):Array<test310.E<Int64>>{[test310.E<Int64>.e(1)].toArray()}
    func x(a:Int64):Array<test310.E<Int64>>{@{test310.E<Int64>.e(1)}}
    var i : Int64 = 10
    var myArray : ArrayList<Array<test310.E<Int64>>> = ArrayList<Array<test310.E<Int64>>>(i,x)
    return 0
}
