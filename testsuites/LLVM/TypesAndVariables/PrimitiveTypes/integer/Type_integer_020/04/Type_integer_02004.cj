// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected expression here

func main(): Int64 {
    let int32_var_A: Int32 = -_32768

    if (int32_var_A != -32768) {
        return 1
    }
    return 0

}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
