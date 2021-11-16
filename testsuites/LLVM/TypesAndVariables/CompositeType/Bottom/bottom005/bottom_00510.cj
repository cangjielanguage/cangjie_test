// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func test() : Bool {
var a : Int64 = return true
return a // EXPECTED: regex type of return expression is incompatible with return type
}

func main(): Int64 {
if (test()) {
return 0
} else {
return 1
}
}
