// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call 'test'
// ASSERT: regex named parameters must be listed behind all non-named parameters
func test(a!:Int64 = 1,b!:Int64 = 1,c:Int64){return 0}

func main(): Int64 {
    return test(c = 1)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
