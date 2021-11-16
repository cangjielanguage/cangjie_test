// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


func test(): Int64 {
return size([1]) // EXPECTED: regex undeclared identifier 'size'
}

func main(): Int64 {
return test()
}
