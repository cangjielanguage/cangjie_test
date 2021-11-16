// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Exception
// ASSERT: scan throwable_20067.cj:7)

func main() {
    var exp = Exception()
    try {
        throw exp
    } catch (t:Throwable) {
        t.printStackTrace()
        return 0
    }
}
