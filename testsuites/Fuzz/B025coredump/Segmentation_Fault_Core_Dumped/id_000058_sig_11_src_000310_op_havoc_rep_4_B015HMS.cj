// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var m9999999999999999999999999999yArray1 : intH2[] = @{}
    var myArra32[](] = @{@{}}
    return 0
}
