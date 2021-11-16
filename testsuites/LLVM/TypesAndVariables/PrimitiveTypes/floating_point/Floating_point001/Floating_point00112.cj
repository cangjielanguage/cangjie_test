// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
func main(): Int64 {
    var a:Float16 = 1.5
    var b:FLOAT32 = 1.5 // EXPECTED: regex undeclared type name 'FLOAT32'
    if (a-b>0.0001) {
        return 1
    }
    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
