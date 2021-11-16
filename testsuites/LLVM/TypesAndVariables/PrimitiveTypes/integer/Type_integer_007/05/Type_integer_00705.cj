// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'Int'

func main(): Int64 {
    let int64_One: Int 64 = 2147483647

    if (int64_One == 2147483647) {
        return 1
    } else {
        return 0
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
