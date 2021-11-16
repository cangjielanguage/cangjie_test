// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex  expected member name or constructor call after 'C' type name

class C{}

func main(): Int64 {
    C
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
