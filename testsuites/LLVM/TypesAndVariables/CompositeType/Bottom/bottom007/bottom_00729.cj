// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record A<T>{
init(a:T){}
}

func test():A<Int64> {
A<Int32>(return A<Int64>(0)) // EXPECTED: regex argument type of nothing is not supported
}

func main(): Int64 {
test()
return 0
}
