// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(a:Int8=1):Int64{return 1}
func test(a:Int16=1):Int64{return 1}

func main(){
    test() // EXPECTED: regex  ambiguous match for function call
    return 1
}