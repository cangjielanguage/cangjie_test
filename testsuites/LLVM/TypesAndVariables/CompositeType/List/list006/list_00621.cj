// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace



func test(): Bool {
return isEmpty([1]) // EXPECTED: regex undeclared identifier 'isEmpty'
}

func main(): Int64 {
if (!test()) {
return 0
}
return 1
}
