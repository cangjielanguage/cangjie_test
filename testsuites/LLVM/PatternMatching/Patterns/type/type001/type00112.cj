// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func test(): Int64 {
var i : Int32 = 0
var res = match (i) {
case a : test => 1 // EXPECTED: regex 'test' is not a type
case _ => 0
}
if (res != 0) {
return 1
}
return 0
}

func main(): Int64 {
return test()
}
