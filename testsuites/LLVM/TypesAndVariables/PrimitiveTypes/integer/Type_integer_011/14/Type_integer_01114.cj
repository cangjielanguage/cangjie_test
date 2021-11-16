// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected newline or ';' between expression or declaration

func main(): Int64
{
    var uint8_var_One: UInt8 = 128a
    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
