// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(a:Bool=return 0) { // EXPECTED: regex only named parameters can have a default
return 0
}

func main(): Int64 {
return test()
}
