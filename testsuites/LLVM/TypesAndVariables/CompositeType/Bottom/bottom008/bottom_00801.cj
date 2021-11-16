// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-auto type of function body is incompatible with return type
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// if (e1) {e2} else {e3}, whole expression`s type depend on e2 and e3`s type.
// func test():Int64 = if (return 1) {return 2}

func test():Int64 { if (return 1) {return 2} } // EXPECTED: regex-not 'return' is not allowed here

func main(): Int64 {
return 1
}
