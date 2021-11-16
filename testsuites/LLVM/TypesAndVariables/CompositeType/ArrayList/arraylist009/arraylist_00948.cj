// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan IndexOutOfBoundsException

func main(): Int64 {
    var a : Int64 = 10
    func x(input:Int64):Int64{1}
    var b : ArrayList<Int64> = ArrayList<Int64>(a,x)
    b.removeAt(-1)
    return 1
}