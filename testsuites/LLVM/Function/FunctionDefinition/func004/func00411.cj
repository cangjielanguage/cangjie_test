// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
func test(a! : Int32 = 0, b : Int32): Int32 { // EXPECTED: regex named parameters must be listed behind all non-named parameters
    return a
}

func main(): Int64 {
    return test(a:0,0)
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
