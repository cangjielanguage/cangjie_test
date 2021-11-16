// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

enum A{a(Int64)}

// func test():Int64 = A.a(return 1)

func test():Int64 { A.a(return 1) } // EXPECTED: regex argument type of nothing is not supported


func main(): Int64 {
return 1
}
