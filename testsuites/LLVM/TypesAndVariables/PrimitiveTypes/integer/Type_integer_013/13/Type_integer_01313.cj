// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected newline or ';' between expression or declaration

func main(): Int64 {
    let uint16_One: UInt16 = 127a
    0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
