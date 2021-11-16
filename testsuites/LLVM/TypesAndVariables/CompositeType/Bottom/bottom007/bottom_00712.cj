// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-auto type of function body is incompatible with return type
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// func test():Int64 = Int64(return 0)

func test():Int64 { Int64(return 0) }// EXPECTED: regex-not 'return' is not allowed here

func main(): Int64 {
return test()
}
