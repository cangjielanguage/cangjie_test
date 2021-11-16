// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-auto type of function body is incompatible with return type
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// e2 is range type, not match Bool
// func test() : Int64 = return 1 ? return 2 .. return 3 : return 4 : return 5

func test() : Int64 { (return 1) ? (return 2) .. (return 3) : (return 4) : (return 5) } // EXPECTED: regex-not 'return' is not allowed here


func main(): Int64 {
return test() - 1
}
