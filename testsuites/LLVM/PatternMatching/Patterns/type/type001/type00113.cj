// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func test(): Int32 {
var i : Int32 = 0
var res = match (i) {
case a : => 1 // EXPECTED: regex expected type
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
