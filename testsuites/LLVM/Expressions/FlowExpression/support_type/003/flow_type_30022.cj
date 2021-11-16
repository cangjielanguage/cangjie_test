// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type mytype<T> = List<T>

func f<T>(input:T):Int64 {0}

func test<T>(input:T):Int64 {
    return [input] |> f
}

func main(): Int64 {
    return test<Int64>(1)
}
