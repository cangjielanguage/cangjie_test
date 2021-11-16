// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// e1?e2:e3 , only e1 is bottom type, whole type depend on e2 and e3.

func test() : Int64 { if (return true) {false} else {true} } // EXPECTED: regex type of return expression is incompatible with return type

func main(): Int64 {
if (test()) { // true
return 0
}
return 1
}
