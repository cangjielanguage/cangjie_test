// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan IndexOutOfBoundsException
func main(): Int64 {
    var l : Int64 = 9223372036854775807 // MAX_INT64, 1<<63 - 1
    func x(input:Int64):Int64{input}
    var a : ArrayList<Int64> = ArrayList<Int64>(0)

    a.set(l - 1,1)

    return a.get(l - 1) - 1
}