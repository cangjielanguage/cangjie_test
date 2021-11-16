// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var a : Int32 = 0
    ++a // EXPECTED: regex-auto expected identifier before '++'
    return 1
}
