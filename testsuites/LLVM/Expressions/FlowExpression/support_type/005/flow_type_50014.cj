// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{a}

func x<T>(input:A<Int64>):A<Int64> {input}

func y<T>(input:A<Int64>):A<Int64> {input}

func test<T>(input:T):Int64 {
    A<Int64>.a |> (x<T> ~> y<T>)
    return 0
}

func main(): Int64 {
    return test<Int64>(1)
}
