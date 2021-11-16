// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{a}

func x<T>(input:T):T {input}
func y<T>(input:T):T {input}

func test<T>(input:T):T {
    return input |> (x<T> ~> y<T>)
}

func foo<T>(input:T):Int64{
    test<A<T>>(A<T>.a)
    return 0
}

func bar<T>(input:T):Int64{
    A<T>.a |> (x<A<T>> ~> y<A<T>>)
    return 0
}

func main(): Int64 {
    return foo(1) + bar(1)
}
