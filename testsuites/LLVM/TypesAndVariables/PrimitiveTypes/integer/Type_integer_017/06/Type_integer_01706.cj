// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'Int'

func main(): Int64 {
    let uint64_One: Int%Int = 127

    if (uint64_One == 127) {
        return 1
    } else {
        return 0
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
