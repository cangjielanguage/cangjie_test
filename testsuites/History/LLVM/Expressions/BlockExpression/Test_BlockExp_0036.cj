// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'b'
// ASSERT: regex type check of binary expression fails

func main(): Int64 {
    let val1 = {
                   var a: UInt64 = 139
                   var b: UInt64 = 116
                   +b
                   a
               }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace