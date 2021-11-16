// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not IndexOutOfBoundsExceptionArrayIndexOutOfBoundsException

func main(): Int64 {
    try {
        var res2 = "中国中"[0..4:1]
    } catch (e:IndexOutOfBoundsException){
        e.printStackTrace()
        return 0
    }
    return 1
}
