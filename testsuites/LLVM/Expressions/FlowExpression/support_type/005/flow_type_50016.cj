// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x<T>(input:Option<T>):Option<T> {input}

func y<T>(input:Option<T>):Option<T> {input}

func test<T>(input:T):Int64 {
    None<T> |> (x<T> ~> y<T>)
    return 0
}

func main(): Int64 {
    return test<Int64>(1)
}
