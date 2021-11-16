// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan IndexOutOfBoundsException

func main(): Int64 {
    var a : Int64 = 0
    func x(input:Int64):Int64{input}
    var b : ArrayList<Int64> = ArrayList<Int64>(a,x)
    b.removeAt(0)
    return 1
}