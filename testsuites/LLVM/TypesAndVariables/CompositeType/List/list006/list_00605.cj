// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


func test(): Int64 {
return [[]].size() // EXPECTED: regex empty list literal type cannot be inferred
}

func main(): Int64 {
return test()
}
