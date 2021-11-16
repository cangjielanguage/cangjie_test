// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected newline or ';' between expression or declaration

func main(): Int64 {
    let int16_A: Int16 = 12a7
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
