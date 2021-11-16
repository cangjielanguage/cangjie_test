// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test() : Bool { // EXPECTED: regex type of function body is incompatible with return type
var a : Int64 = return true
a
}

func main(): Int64 {
if (test()) {
return 0
} else {
return 1
}
}
