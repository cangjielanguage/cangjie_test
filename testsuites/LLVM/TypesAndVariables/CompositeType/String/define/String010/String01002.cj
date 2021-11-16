// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex escape unicode must be 1 to 8 hexadecimal digits

func main(): Int64 {
    var varString : String = "\u{123456789}"
    return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
