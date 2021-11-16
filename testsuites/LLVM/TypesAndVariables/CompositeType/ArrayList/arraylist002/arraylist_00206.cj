// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    func x(a:Int64):UInt32{UInt32(a)}
    var i : Int64 = 10
    var myArray : ArrayList<UInt32> = ArrayList<UInt32>(i,x)
    return 0
}