// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var r : Int32 = 2
    (return 0) = 2 // EXPECTED: regex illegal left value
    while (false) {
        continue = 2 // EXPECTED: regex illegal left value
        break = 2 // EXPECTED: regex illegal left value
    }
    return 0
}
