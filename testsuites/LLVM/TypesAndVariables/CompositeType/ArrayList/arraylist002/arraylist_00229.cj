// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    func x(a:Int64):Option<Int64>{Option<Int64>.Some(1)}
    var i : Int64 = 10
    var myArray : ArrayList<Option<Int64>> = ArrayList<Option<Int64>>(i,x)
    return 0
}