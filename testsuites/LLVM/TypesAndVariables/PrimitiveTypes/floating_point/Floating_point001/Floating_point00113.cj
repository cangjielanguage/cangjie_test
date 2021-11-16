// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
func main(): Int64 {
    var a:Float64 = 1.5
    var b:FLOAT64 = 1.5 // EXPECTED: regex undeclared type name 'FLOAT64'
    if (a-b>0.0001) {
        return 1
    }
    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
