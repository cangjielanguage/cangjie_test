// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x<T>(input:ArrayList<T>):ArrayList<T> {input}

func y<T>(input:ArrayList<T>):ArrayList<T> {input}

func test<T>(input:T):Int64 {
    ArrayList<T>([input].toArray()) |> (x<T> ~> y<T>)
    return 0
}

func main(): Int64 {
    return test<Int64>(1)
}
