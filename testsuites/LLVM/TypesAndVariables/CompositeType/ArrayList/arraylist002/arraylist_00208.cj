// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    func x(a:Int64):UInt64{UInt64(a)}
    var i : Int64 = 10
    var myArray : ArrayList<UInt64> = ArrayList<UInt64>(i,x)
    return 0
}