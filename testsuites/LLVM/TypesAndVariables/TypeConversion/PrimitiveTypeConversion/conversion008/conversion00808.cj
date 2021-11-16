// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call

func main(): Int64 {
    var b = chr(0.1)
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
