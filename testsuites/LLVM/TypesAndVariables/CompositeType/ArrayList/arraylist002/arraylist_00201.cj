// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    func x(a:Int64):UInt8{UInt8(a)}
    var i : Int64 = 10
    var myArray : ArrayList<UInt8> = ArrayList<UInt8>(i,x)
    return 0
}