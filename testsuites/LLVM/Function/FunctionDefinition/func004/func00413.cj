// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected \'\,\' to separate or \'\)\' to close
func test(a : Int64  0): Int64 {
    return 0
}

func main(): Int64 {
    return test(0)
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
