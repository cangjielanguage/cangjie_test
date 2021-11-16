// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex IndexOutOfBoundsException
func main(): Int64 {
    var l : Int64 = 10
    func x(input:Int64):Int64{input}
    var a : ArrayList<Int64> = ArrayList<Int64>(0)

    a.set(0,1)

    return 1
}