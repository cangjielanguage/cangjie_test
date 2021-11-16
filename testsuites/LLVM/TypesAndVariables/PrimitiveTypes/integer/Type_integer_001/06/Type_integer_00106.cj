// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'int_8'

func main(): Int64 {
    var int8_Low_Median_One: int_8 = 127

    if (int8_Low_Median_One == 127) {
        return 1
    } else {
        return 0
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
