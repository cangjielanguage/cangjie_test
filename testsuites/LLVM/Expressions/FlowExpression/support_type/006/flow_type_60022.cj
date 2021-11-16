// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type mytype<T> = List<T>

func x<T>(input:T):T {input}
func y<T>(input:T):T {input}

func test<T>(input:T):T {
    return input |> (x<T> ~> y<T>)
}

func foo<T>(input:T):Int64{
    test<mytype<T>>([input])
    return 0
}

func bar<T>(input:T):Int64{
    [input] |> (x<mytype<T>> ~> y<mytype<T>>)
    return 0
}

func main(): Int64 {
    return foo(1) + bar(1)
}
