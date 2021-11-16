// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Int64 {
iterator([]) // EXPECTED: regex undeclared identifier 'iterator'
return 0
}

func main(): Int64 {
test()
}
