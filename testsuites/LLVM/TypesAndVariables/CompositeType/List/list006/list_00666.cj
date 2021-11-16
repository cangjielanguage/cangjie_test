// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Int64 {
var b = [].toArray() // EXPECTED: regex empty list literal type cannot be inferred
return 0
}

func main(): Int64 {
test()
}
