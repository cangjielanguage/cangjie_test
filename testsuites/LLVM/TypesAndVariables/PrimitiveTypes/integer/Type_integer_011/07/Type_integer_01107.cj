// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'uint08'

func main(): Int64 {
    var uint8_Low_Median_One: uint08 = 128
    0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
