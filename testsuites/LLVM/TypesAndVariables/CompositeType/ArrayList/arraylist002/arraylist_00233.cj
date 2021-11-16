// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    func y(a:Int64):ArrayList<Int64>{ArrayList<Int64>([a].toArray())}
    func x(a:Int64):ArrayList<Int64>{ArrayList<Int64>(a)}
    var i : Int64 = 10
    var myArray : ArrayList<ArrayList<Int64>> = ArrayList<ArrayList<Int64>>(i,x)
    return 0
}
