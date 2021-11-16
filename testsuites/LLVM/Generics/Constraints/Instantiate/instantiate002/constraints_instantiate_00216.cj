// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{}

interface B<T> <: A<B<T>> where T <: A<T>{}

class C <: A<C>{}

func main():Int64{
    func test(a:B<C>){}
    return 0
}
