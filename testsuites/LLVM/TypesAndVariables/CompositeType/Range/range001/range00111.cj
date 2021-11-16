// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex expected expression here

func main(): Int64 {
    let a = 1..10:
    let b = 1..10:1
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
