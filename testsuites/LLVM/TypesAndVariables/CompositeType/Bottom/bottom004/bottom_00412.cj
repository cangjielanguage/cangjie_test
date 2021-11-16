// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test():Bool { // EXPECTED: regex type of function body is incompatible with return type
return true
1
}

func main(): Int64 {
test()
return 0
}
