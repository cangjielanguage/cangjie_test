// ERRCHECK: %compiler %cmp_opt %f -o %output
record A<T>{
    init(a:T){}
}

func test():A<Int32> {
    A<Int32>(return A<Int32>(0)) // EXPECTED: regex argument type of nothing is not supported
}

func main(): Int64 {
    test()
    return 0
}
