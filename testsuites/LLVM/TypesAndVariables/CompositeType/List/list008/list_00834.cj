// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{
    func test(input:List<T>):List<T>{input}
}

class C<T> <: A<T>{}

func main(): Int64 {
    var a : A<Int64> = C<Int64>()
    return a.test([1]).size() - 1
}
