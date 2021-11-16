// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex cannot assign to value which is an initialized 'let' constant
func test(): Int64 {
    let assign = { a : Int64 => a = 0}
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
