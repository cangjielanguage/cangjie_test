// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// EXPECTED: regex-not stack trace
// EXPECTED: regex-not core dumped

func test(){}
func main(): Int32 {
test(
return 1 // EXPECTED: regex-auto expected ',' to separate or ')' to close
}

