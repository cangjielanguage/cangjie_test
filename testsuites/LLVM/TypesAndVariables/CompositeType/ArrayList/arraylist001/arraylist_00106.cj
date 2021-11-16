// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    func x(a:Int64):Int64{a}
    var myArray : ArrayList<Int64> = ArrayList<Int64>(5,x)
    for (i in 0..5) {
        if (i != myArray[i]) {
            return i
        }
    }
    return 0
}
