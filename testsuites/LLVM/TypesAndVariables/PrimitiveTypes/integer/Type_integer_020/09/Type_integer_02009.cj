// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected expression here

func main(): Int64 {
    var int32_var_A: Int32 = -___32768

}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
