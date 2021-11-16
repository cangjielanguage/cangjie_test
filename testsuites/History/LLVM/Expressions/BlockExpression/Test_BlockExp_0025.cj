// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'a'

func main(): Int64 {
    let val1 = {
                   var a: Int64 = 2147483647
                   -a
               }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace