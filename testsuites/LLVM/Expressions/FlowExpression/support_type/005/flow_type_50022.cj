// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type mytype<T> = List<T>

func x<T>(input:mytype<T>):mytype<T> {input}

func y<T>(input:mytype<T>):mytype<T> {input}

func test<T>(input:T):Int64 {
    [input] |> (x<T> ~> y<T>)
    return 0
}

func main(): Int64 {
    return test<Int64>(1)
}
