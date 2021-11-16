// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected function name after 'func'
func @(): Int64 {
    return 1
}

func main(): Int64 {
    return @()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
