// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args | compare %f
// ASSERT: scan finally!
// ASSERT: scan-not catch!


func main() {
    try { throw Throwable() }
    catch (_:Error){print("catch!")}
    finally {print("finally!")}
    return 0
}
