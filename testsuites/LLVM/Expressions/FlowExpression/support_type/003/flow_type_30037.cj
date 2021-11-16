// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func f<T>(input:T):Int64 {0}

func test<T>(input:T):Int64 {
    return ArrayList<Int64>([1].toArray()) |> f
}

func main(): Int64 {
    return test<Int64>(1)
}
