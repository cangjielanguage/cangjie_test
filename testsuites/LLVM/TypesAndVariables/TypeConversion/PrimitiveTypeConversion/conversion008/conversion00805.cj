// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex the number '-1' exceeds the value range of type 'UInt32'

func main(): Int64 {
    var b = chr(-1)
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
