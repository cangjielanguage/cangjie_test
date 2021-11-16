// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// range type not match Int64
// func test():Int64 = return 1 .. return 2 : return 3

func test():Int64 { return 1 .. return 2 : return 3 } // EXPECTED: regex type of return expression is incompatible with return type


func main(): Int64 {
return 1
}

