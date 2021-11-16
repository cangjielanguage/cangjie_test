// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto use no-numeric type expr for numeric type convert

func main(): Int64 {
    var a = Int32(())
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
