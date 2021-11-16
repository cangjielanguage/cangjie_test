// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan NegativeArraySizeException

func main(): Int64 {
    func x(a:Int64):Int64{a}
    var i : Int64 = -1
    var a = ArrayList<Int64>(i,x)
    return 0
}