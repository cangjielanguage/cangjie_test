// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func test(): Int64 {
var i : Int32 = 1
var res = match (i) {
case a : This => 0 // EXPECTED: regex 'This' type is not allowed here
case _ => 1
}
if (res != 0) {
return 1
}
return 0
}

func main(): Int64 {
return test()
}
