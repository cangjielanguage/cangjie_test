// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(a:Int16):Int64{return 1}
func test(a:Int32):Int64{return 2}

func main(){
    test(1) // EXPECTED: regex ambiguous match for function call
    return 1
}


