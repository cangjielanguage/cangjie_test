// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'UInt'

func main(): Int64 {
    let uint16_One: UInt 16 = 32767

    if (uint16_One == 32767) {
        return 1
    } else {
        return 0
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
