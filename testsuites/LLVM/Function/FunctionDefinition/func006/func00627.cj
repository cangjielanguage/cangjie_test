// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex 'class' is not allowed in block, expected expression or declaration here

func main(): Int32 {
    class test{}
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
