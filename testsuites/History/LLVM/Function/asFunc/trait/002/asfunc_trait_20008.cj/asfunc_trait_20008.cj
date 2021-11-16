// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{}
class B<T> <: A<T>{}

trait C{
    func asFunc(input:This):Int64
}

append<T> A<T> with C{
    func asFunc(input:A<T>):Int64{0}
}

func test<T>(input:T){
    var a : A<T> = B<T>()
    return a()
}

func main(): Int64 {
    return test<Int64>(1)
}
