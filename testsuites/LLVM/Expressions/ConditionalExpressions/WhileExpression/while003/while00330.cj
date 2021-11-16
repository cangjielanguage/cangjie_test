// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var test : Int32
    while (true) {
        .test        // EXPECTED: regex expected identifier before '.'
        return 0
    }
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
