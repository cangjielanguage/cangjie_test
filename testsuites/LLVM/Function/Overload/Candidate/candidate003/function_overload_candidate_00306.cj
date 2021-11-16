// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(){}
func test(a:Int64=1){}

func main():Int64{
    test() // EXPECTED: regex ambiguous match for function call
    return 0
}