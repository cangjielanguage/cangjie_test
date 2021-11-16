// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package packageTest

internal class A{}

external record B{}

external  var a:A*B =(A(),B())// EXPECTED: regex external declaration uses internal types

func main(): Int64 {
    return 0
}
