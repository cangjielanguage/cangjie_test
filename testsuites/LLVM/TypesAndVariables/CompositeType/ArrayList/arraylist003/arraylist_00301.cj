// DEPENDENCE: 301.cj  301.cfg
// EXEC: %compiler %cmp_opt -c 301.cj -o test301.%middle 
// EXEC: %compiler %cmp_opt  %f test301.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test301.*

func y<T>(a:T):T{a}
func x<T>(a:Int64):(T)->T{y<T>}

func main(): Int64 {
    var i : Int64 = 10
    var myArray : ArrayList<(test301.X)->test301.X> = ArrayList<(test301.X)->test301.X>(i,x<test301.X>)
    return 0
}
