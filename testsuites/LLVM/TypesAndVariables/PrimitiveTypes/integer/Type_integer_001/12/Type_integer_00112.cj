// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'a127'

func main(): Int64 {
    var int8_var_A: Int8 = a127
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
