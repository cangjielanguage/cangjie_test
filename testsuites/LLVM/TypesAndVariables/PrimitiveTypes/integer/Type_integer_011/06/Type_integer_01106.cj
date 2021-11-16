// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'uint_8'

func main(): Int64 {
    var uint8_Low_Median_One: uint_8 = 128

    if (uint8_Low_Median_One == 128) {
        return 1
    } else {
        return 0
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
