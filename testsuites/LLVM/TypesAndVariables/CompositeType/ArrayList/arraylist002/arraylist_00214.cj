// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    func y(a:Int64):Int64{a}
    func x(a:Int64):(Int64)->Int64{y}
    var i : Int64 = 10
    var myArray : ArrayList<(Int64)->Int64> = ArrayList<(Int64)->Int64>(i,x)
    return 0
}