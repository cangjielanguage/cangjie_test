// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func x<T>(input:T):T {input}
func y<T>(input:T):T {input}

func test<T>(input:T):T {
    return input |> (x<T> ~> y<T>)
}

func foo<T>(input:T):Int64{
    test<Int64>((return 0)) // EXPECTED: regex-not 'return' is not allowed here
    return 0
}

func bar<T>(input:T):Int64{
    (return 0) |> (x<Int64> ~> y<Int64>) // EXPECTED: regex-not 'return' is not allowed here
    return 0
}

func main(): Int64 {
    return foo(1) + bar(1)
}
