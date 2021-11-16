// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{a}

func f<T>(input:T):Int64 {0}

func test<T>(input:T):Int64 {
    return A<Int64>.a |> f
}

func main(): Int64 {
    return test<Int64>(1)
}
