// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{a}

func f<T>(input:A<T>):Int64 {0}

func test<T>(input:T):Int64 {
    return A<T>.a |> f<T>
}

func main(): Int64 {
    return test<Int64>(1)
}
