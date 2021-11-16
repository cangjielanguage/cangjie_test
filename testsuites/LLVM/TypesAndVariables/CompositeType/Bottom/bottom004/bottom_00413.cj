// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Unit {
return // EXPECTED: regex type of return expression is incompatible with return type
1
}

func main(): Int64 {
test()
return 0
}
