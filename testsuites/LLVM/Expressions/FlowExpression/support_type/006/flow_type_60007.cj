// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T>{}

func x<T>(input:T):T {input}
func y<T>(input:T):T {input}

func test<T>(input:T):T {
    return input |> (x<T> ~> y<T>)
}

func foo<T>(input:T):Int64{
    test(A<Int64>())
    return 0
}

func bar<T>(input:T):Int64{
    A<Int64>() |> (x<A<T>> ~> y<A<T>>) // EXPECTED: regex type check of flow expression fails for operator
    return 0
}

func main(): Int64 {
    return foo(1) + bar(true)
}
