// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main(): Int64{
    var a: Int64 = 2
    var b: Int64
    a **= b    // EXPECTED: regex variable 'b' is used before initialization
    print("${a}")
    return 0
}