// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T>{
    func test(input:List<T>):List<T>{input}
}

func main(): Int64 {
    return A<Int64>().test([1]).size() - 1
}
