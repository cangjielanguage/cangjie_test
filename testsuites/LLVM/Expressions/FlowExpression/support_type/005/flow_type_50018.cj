// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x<T>(input:Option<Int64>):Option<Int64> {input}

func y<T>(input:Option<Int64>):Option<Int64> {input}

func test<T>(input:T):Int64 {
    Some<Int64>(1) |> (x<T> ~> y<T>)
    return 0
}

func main(): Int64 {
    return test<Int64>(1)
}
