// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T>{}

extend A<T>{
    func test(){0}
}

func main(): Int64 {
    var a : A<?Int64> = A<?Int64>()
    a.test()
}