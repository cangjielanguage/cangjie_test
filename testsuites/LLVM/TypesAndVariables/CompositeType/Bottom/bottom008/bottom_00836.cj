// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T>{
    static func test<X>(a:X, b:X):Int64 {2}
}

// func test():Int64 = A<Bool>.test(return 0,return 1) // type infer?

func test():Int64 { A<Bool>.test(return 0,return 1) } // EXPECTED: regex argument type of nothing is not supported

func main(): Int64 {
    return test()
}
