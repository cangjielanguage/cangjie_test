// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args | compare %f
// ASSERT: scan NoneValueException: Value does not exist!

func main(): Int64 {
    var map01:Map<Int64,Int64> = #{3:3,4:5,5:6}
    var value8= map01[8]
    return 0
}
