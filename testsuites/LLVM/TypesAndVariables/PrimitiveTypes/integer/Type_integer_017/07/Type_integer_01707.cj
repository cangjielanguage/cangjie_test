// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'uint641'

func main(): Int64 {
    var uint64_One: uint641 = 127
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
