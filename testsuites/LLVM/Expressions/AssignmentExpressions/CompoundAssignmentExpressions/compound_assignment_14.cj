// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var a: Int32 = 1
    a += 2147483648  // EXPECTED: regex the number '2147483648' exceeds the value range of type 'Int32'
    return 0
}