// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace



func test(): Bool {
return [].isEmpty() // EXPECTED: regex empty list literal type cannot be inferred
}

func main(): Int64 {
if (!test()) {
return 0
}
return 1
}
