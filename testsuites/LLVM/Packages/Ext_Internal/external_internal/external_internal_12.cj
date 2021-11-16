// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package packageTest

internal enum TimeUnit1 {
    Year | Month | Day | Hour
}


external record  A{
    var a:TimeUnit1=TimeUnit1.Month // EXPECTED: regex external declaration uses internal types
}

func main(): Int64 {

    return 0
}
