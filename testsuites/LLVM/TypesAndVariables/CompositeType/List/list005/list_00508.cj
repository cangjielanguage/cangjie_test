// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Int64 {
var a : List<List<Int64>> = [[1],1] // EXPECTED: regex inconsistent element type for List literal
return a.size() - 1
}

func main(): Int64 {
return test()
}
