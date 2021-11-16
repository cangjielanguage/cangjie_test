// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan test

func main() {
    var t = Throwable("test")
    throw t
    return 0
}
