// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func f<T>(input:T):T{input}


func main(): Int64 {
    1 |> (f<Int64> ~> f<Int64>)
    return 0
}
