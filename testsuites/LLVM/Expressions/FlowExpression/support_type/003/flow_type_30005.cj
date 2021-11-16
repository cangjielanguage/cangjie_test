// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{}

func f<T>(input:T):Int64 {0}

func test<T>(input:T):Int64 {
    return A<T>() |> f
}

func main(): Int64 {
    return test<Int64>(1)
}
