// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// return can not be left value?
// func test() : Unit = (return) = (return)

func test() : Unit { (return) = (return) } // EXPECTED: regex invalid return expression


func main(): Int64 {
return 1
}
