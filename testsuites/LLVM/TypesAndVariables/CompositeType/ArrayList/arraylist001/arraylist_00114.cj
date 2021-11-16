// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    func x(a:Int64):Int64{a}
    var i : Int64 = 5
    var a = ArrayList<Int64>(i,x)
    var b = ArrayList<Int64>(i+1,x)
    a = b
    return a.size() - 6
}