// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T>{}

func x<T>(input:A<T>):A<T> {input}

func y<T>(input:A<T>):A<T> {input}

func test<T>(input:T):Int64 {
    A<T>() |> (x<T> ~> y<T>)
    return 0
}

func main(): Int64 {
    return test<Int64>(1)
}
