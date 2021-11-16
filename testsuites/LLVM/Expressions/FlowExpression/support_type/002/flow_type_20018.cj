// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func f<T>(input:Option<Int64>):Int64 {0}

func test<T>(input:T):Int64 {
    return Some<Int64>(1) |> f<T>
}

func main(): Int64 {
    return test<Int64>(1)
}
