// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main(): Int64{
    var a: Int64
    a **= 2    // EXPECTED: regex variable 'a' is used before initialization
    return 0
}