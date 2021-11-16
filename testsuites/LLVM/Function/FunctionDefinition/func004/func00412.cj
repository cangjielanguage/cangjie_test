// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex not match to expected type 'Int32'

func test(a : Int32 = 0.1): Int32 {
    return 0
}

func main(): Int64 {
    return test()
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
