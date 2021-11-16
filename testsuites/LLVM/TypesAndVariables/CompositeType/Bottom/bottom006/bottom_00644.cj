// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-auto type of function body is incompatible with return type
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// e2 is range type, not match Bool
// func test() : Bool = if (false) {(return false) .. (return false)} else { return true }

func test() : Bool {if (false) {(return false) .. (return false)} else {return true} } // EXPECTED: regex-not 'return' is not allowed here


func main(): Int64 {
if (test()) {
return 1
}
return 0
}
