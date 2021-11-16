// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'uint_16'

func main(): Int64 {
    let uint16_One: uint_16 = 127

    if (uint16_One == 127) {
        return 1
    } else {
        return 0
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
