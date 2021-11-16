// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex the number '4294967296' exceeds the value range of type 'UInt32'

func main(): Int64 {
    var b = chr(4294967296)
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
