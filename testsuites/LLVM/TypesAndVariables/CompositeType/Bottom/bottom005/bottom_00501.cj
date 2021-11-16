// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test() : Int64 { // EXPECTED : regex type of function body is incompatible with return type
var a : Int64 = return 1 // definition is Unit type, block is Unit type, not match Int64.
}

func main(): Int64 {
return 0
}
