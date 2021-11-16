// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'uint160'

func main(): Int64 {
    var uint16_One: uint160 = 127
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
