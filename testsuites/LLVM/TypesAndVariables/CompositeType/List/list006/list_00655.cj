// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Int64 {
[1,2,3][] // EXPECTED: regex invalid expression initialization
return 1
}

func main(): Int64 {
test()
}
