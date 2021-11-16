// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x<T>(input:T*T):T*T {input}

func y<T>(input:T*T):T*T {input}

func test<T>(input:T):Int64 {
    (input,input) |> (x<T> ~> y<T>)
    return 0
}

func main(): Int64 {
    return test<Int64>(1)
}
