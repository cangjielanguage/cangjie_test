// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(a:Int8):Int64{1}
func test(a:Int16):Int64{2}

func main():Int64{
    test(1) // EXPECTED: regex ambiguous match for function call
    return 0
}