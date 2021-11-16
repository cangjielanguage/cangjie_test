// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto undeclared identifier 'printf'

func main(): Int64 {
    var a: Float32 = 1.0
    printf("%d", a)
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
