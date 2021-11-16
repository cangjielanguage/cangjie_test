// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT:scan Compiler error, type of parameter must be Int64.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
    var d: Int32 = 1000
    sleep(d) // Compiler error, type of parameter must be Int64.
    return 0
}
