// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Int64 {
var a : List<Int64> = [1,2,3]
var b : List<Int32> = [1,2,3]
a = b // EXPECTED: regex type incompatible in this assignment
return 0
}

func main(): Int64 {
return test()
}
