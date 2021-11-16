// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-auto type of function body is incompatible with return type
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// func test():Int64 = for (i in (return 1)) {return 2}

func test():Int64 { for (i in (return 1)) {return 2} }// EXPECTED: regex-not 'return' is not allowed here


func main(): Int64 {
return test() - 1
}
