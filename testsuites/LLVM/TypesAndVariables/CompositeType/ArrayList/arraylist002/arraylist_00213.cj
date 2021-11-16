// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    func x(a:Int64):Range<Int64>{a..10}
    var i : Int64 = 10
    var myArray : ArrayList<Range<Int64>> = ArrayList<Range<Int64>>(i,x)
    return 0
}