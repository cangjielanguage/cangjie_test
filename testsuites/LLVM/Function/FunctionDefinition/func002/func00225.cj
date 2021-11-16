// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex backquote identifier is empty
func ``(): Int64 {
    return 1
}

func main(): Int64 {
    return ``()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
