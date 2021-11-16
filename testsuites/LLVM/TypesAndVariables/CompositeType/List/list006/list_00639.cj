// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Int64 {
var a : List<Int64> = [1,2,3]
return a.get() // EXPECTED: regex no matching function declaration for function call
}

func main(): Int64 {
test()
}
