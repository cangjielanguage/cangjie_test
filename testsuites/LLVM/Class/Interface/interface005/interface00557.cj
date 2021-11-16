// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex  expected member name or constructor call after 'I' type name

interface I{}

func main(): Int64 {
    I
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
