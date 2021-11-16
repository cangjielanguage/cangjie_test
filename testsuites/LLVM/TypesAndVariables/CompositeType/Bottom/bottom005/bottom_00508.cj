// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test() : Bool {
var a : Int64 = return true
1
}

func main(): Int64 {
if (test()) {
return 0
} else {
return 1
}
}
