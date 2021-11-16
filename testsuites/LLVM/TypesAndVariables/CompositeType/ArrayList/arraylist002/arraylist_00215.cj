// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func y<T>(a:T):T{a}
func x<T>(a:Int64):(T)->T{y<T>}

func main(): Int64 {
    var i : Int64 = 10
    var myArray : ArrayList<(Int64)->Int64> = ArrayList<(Int64)->Int64>(i,x<Int64>)
    return 0
}