// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type mytype = Int64

func x<T>(input:T):T {input}
func y<T>(input:T):T {input}

func test<T>(input:T):T {
    return input |> (x<T> ~> y<T>)
}

func foo<T>(input:T):Int64{
    test<mytype>(1)
    return 0
}

func bar<T>(input:T):Int64{
    1 |> (x<mytype> ~> y<mytype>)
    return 0
}

func main(): Int64 {
    return foo(1) + bar(1)
}
