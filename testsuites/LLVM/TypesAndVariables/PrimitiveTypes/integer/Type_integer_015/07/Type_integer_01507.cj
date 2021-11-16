// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'uint321'

func main(): Int64 {
    var uint32_One: uint321 = 127
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
