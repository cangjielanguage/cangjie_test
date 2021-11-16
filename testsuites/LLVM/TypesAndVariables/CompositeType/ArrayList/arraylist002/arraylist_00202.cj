// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    func x(a:Int64):Int8{Int8(a)}
    var i : Int64 = 10
    var myArray : ArrayList<Int8> = ArrayList<Int8>(i,x)
    return 0
}