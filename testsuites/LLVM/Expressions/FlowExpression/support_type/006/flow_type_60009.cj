// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{}
class B<T> <: A<T>{}

func x<T>(input:T):T {input}
func y<T>(input:T):T {input}

func test<T>(input:T):T {
    return input |> (x<T> ~> y<T>)
}

func foo<T>(input:T):Int64{
    test<A<Int64>>(B<Int64>())
    return 0
}

func bar<T>(input:T):Int64{
    B<Int64>() |> (x<A<Int64>> ~> y<A<Int64>>)
    return 0
}

func main(): Int64 {
    return foo(1) + bar(1)
}
