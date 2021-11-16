// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    //func x(a:Int64):Array<Int64>{[a].toArray()}
    func x(a:Int64):Array<Int64>{@{a}}
    var i : Int64 = 10
    var myArray : ArrayList<Array<Int64>> = ArrayList<Array<Int64>>(i,x)
    return 0
}