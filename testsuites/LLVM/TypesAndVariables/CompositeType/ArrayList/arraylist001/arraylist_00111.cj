// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    func x(a:Int64):Int64{a}
    var myArray = ArrayList<Int64>(0,x)
    if (myArray.size() != 0) {
        return myArray.size()
    }
    return 0
}