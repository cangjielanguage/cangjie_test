// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected function name after \'func\'
func _test(): Int64 {
    return 0
}

func main(): Int64 {
    return _test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
