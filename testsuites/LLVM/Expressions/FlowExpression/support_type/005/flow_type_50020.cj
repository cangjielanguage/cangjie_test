// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x<T>(input:List<T>):List<T> {input}

func y<T>(input:List<T>):List<T> {input}

func test<T>(input:T):Int64 {
    [input] |> (x<T> ~> y<T>)
    return 0
}

func main(): Int64 {
    return test<Int64>(1)
}
