// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Int64 {
let a : List<Int64> = [1,2,3]
var b : List<Int64> = [0]
a = b // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant
return a[0]
}

func main(): Int64 {
return test()
}
