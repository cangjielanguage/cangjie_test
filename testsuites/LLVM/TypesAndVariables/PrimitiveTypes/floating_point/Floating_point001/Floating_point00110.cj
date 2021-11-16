// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
func main(): Int64 {
    var a:Float32 = 1.5
    var b:flo at16 = 1.5 // EXPECTED: regex undeclared type name 'flo'
    if (a-b>0.0001) {
        return 1
    }
    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
