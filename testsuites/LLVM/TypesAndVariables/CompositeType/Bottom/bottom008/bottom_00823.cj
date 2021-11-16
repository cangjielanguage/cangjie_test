// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test() { while (return 1) {return 2} } // EXPECTED: regex type of return expression is incompatible with expression type

func main(): Int64 {
test()
return 0
}
