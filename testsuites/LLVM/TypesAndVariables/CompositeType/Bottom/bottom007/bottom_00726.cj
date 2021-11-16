// ERRCHECK: %compiler %cmp_opt %f -o %output
class A{
    init(a:Int64){}
}

func test():A {
    A(return A(0)) // EXPECTED: regex argument type of nothing is not supported
}

func main(): Int64 {
    test()
    return 0
}
