// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A{
init(a:Int64){}
}

func test():Int64 {
A(return 1) // EXPECTED: regex argument type of nothing is not supported
}

func main(): Int64 {
return test()
}
