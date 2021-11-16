// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x<T>(input:Array<T>):Array<T> {input}

func y<T>(input:Array<T>):Array<T> {input}

func test<T>(input:T):Int64 {
    @{input} |> (x<T> ~> y<T>)
    return 0
}

func main(): Int64 {
    return test<Int64>(1)
}
