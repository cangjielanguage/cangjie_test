// ERRCHECK: %compiler %cmp_opt %f -o %output

class A{
    func test(a:Bool):Int64 {1}
}

// func test():Int64 = A().test(return 0)

func test():Int64 { A().test(return 0) } // EXPECTED: regex argument type of nothing is not supported


func main(): Int64 {
    return test()
}
