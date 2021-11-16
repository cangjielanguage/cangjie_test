// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x<T>(input:T):T {input}
func y<T>(input:T):T {input}

func test<T>(input:T):T {
    return input |> (x<T> ~> y<T>)
}

func foo<T>(input:T):Int64{
    test<List<T>>([input])
    return 0
}

func bar<T>(input:T):Int64{
    [input] |> (x<List<T>> ~> y<List<T>>)
    return 0
}

func main(): Int64 {
    return foo(1) + bar(1)
}
