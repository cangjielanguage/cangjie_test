// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x<T>(input:T):T {input}
func y<T>(input:T):T {input}

func test<T>(input:T):T {
    return input |> (x<T> ~> y<T>)
}

func foo<T>(input:T):Int64{
    test<ArrayList<T>>(ArrayList<T>([input].toArray()))
    return 0
}

func bar<T>(input:T):Int64{
    ArrayList<T>([input].toArray()) |> (x<ArrayList<T>> ~> y<ArrayList<T>>)
    return 0
}

func main(): Int64 {
    return foo(1) + bar(1)
}
