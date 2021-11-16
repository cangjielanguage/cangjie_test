// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


func test(): Int64 {
var x : Float64 = 0.1
var a : List<Int64> = [x] // EXPECTED: regex inconsistent element type for List literal
return a.size()
}

func main(): Int64 {
return test()
}
