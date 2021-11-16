// ERRCHECK: %compiler %cmp_opt %f -o %output


func x<T>(input:T):T {input}
func y<T>(input:T):T {input}

func test<T>(input:T):T {
    return input |> (x<T> ~> y<T>)
}

func foo<T>(input:T):Int64{
    test(Some<Int64>(1))
    return 0
}

func bar<T>(input:T):Int64{
    Some<Int64>(1) |> (x<Option<T>> ~> y<Option<T>>) // EXPECTED: regex type check of flow expression fails for operator
    return 0
}

func main(): Int64 {
    return foo(1) + bar(1)
}
