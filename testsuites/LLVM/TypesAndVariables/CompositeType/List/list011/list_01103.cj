// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
var a = [1 1] // EXPECTED: regex-auto expected ']' in the end of list literal
return 1
}
