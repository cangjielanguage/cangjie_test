// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(a:Int8=1,b:Int16=1){}
func test(a:Int8,b:Int8=1){}


func main():Int64{
    test(Int8(1)) // EXPECTED: regex ambiguous match for function call
    return 0
}