// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A<T>{
static func test<X>(a:Bool, b:Bool):Int64 {2}
}

// func test():Int64 = A<Bool>.test(return 0,return 1)

func test():Int64 { A<Bool>.test((return 0),(return 1)) } // EXPECTED: regex argument type of nothing is not supported

func main(): Int64 {
return test()
}
