// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan catch!finally!


func main() {
    try { throw Throwable() }
    catch (_:Throwable){print("catch!")}
    finally {print("finally!")}
    return 0
}
