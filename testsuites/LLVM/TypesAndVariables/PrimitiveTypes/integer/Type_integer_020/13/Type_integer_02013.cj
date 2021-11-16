// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan expected newline or ';' between expression or declaration

func main(): Int64 {
    let int32_let_A: Int32 = -2_1_474 _8_3_648

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
