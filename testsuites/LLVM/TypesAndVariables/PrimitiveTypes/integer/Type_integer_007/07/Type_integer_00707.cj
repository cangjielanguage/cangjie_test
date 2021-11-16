// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'int641'

func main(): Int64 {
    var int64_One: int641 = 127
    0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
