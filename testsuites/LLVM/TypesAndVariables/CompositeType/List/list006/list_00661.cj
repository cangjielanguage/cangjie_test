// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Int64 {
[[]][0] // EXPECTED: regex empty list literal type cannot be inferred
return 1
}

func main(): Int64 {
test()
}
