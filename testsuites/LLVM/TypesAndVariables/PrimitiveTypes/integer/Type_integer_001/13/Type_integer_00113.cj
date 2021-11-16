// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected newline or ';' between expression or declaration

func main(): Int64 {
    var int8_var_One: Int8 = 1a27

}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
