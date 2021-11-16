// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Set literal, not supported.
// func test():Int64 = #{return 1, return 2}

func test():Int64 { #{return 1, return 2} }  // EXPECTED: regex type of function body is incompatible with return type


func main(): Int64 {
return 1
}

