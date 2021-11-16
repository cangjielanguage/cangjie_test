// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
var a = [,] // EXPECTED: regex inconsistent element type for List literal
return 1
}
