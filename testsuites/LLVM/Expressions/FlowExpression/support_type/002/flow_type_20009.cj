// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{}
class B<T> <: A<T>{}

func f<T>(input:A<Int64>):Int64 {0}

func test<T>(input:T):Int64 {
    return B<Int64>() |> f<T>
}

func main(): Int64 {
    return test<Int64>(1)
}
