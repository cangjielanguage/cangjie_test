// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

//func test() : Bool = (return 10) > (return 2)

func test() : Bool {(return 10) > (return 2)} // EXPECTED: regex type of return expression is incompatible with return type

func main(): Int64 {
return 1
}
