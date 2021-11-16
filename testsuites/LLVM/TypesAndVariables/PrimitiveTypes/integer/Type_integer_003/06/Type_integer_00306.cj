// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'int_16'

func main(): Int64 {
    let int16_One: int_16 = 127

    if (int16_One == 127) {
        return 1
    } else {
        return 0
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
