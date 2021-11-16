// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Int64 {
var a = [1,2,3]
[0]
return a // EXPECTED: regex type of return expression is incompatible with return type
}

func main(): Int64 {
test()
}
