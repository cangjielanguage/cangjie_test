// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    func test(input:List<Int64>):List<Int64>{input}
}

func main(): Int64 {
    return A().test([1]).size() - 1
}
