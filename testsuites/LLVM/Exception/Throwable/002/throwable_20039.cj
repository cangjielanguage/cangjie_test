// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ArithmeticException
// ASSERT: scan throwable_20039.cj:9)
func test(): Int64{
    var (a,b,c) = (1,1,3)
    try{
        a = 3
        b = b / (a-3)
        c = 3
        return a
    } catch (e:Exception) {
        e.printStackTrace()
        return a
    } finally{
        return b
    }
}

func main() {
    test()
}
