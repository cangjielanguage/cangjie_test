// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record A<T>{
init(a:T){}
}

func test():A<Int64> {
A<Int64>(return A<Int32>(0))  // EXPECTED: regex-auto return type for 'init' is mismatched
}

func main(): Int64 {
test()
return 0
}
