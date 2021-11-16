// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait A{
    func test(input:This):This
}

class C<T>{}

append<T> C<T> with A where T<:List<Int64>{
    func test(input:C<T>):C<T>{
        return input
    }
}

func main(): Int64 {
    test(C<List<Int64>>())
    return 0
}
