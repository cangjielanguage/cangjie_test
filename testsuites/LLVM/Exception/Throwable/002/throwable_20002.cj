// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan catch!
// ASSERT: scan IndexOutOfBoundsException
// ASSERT: scan throwable_20002.cj:10
func main() {
    var n = ArrayList<Int64>([1,2,3])
    var res = 3
    try {
            n.set(4,4)
            ()
    }
    catch (e:Exception){print("catch!");e.printStackTrace()}
    finally {res = 0}
    return res
}
