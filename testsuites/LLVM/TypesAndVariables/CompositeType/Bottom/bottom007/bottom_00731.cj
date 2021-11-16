// ERRCHECK: %compiler %cmp_opt %f -o %output
class A<T>{
    var x : T
    init(a:T,b:T){
        x = a
    }
}

func test():A<Int64> {
    A<Int64>(return A<Int64>(0, 0), return A<Int64>(1, 1)) // EXPECTED: regex argument type of nothing is not supported
}

func main(): Int64 {
    return test().x
}
