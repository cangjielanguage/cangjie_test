// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call

func main(): Int64 {
    var a = ord()
    var b = chr()
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
