// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func f<T>(input:T):T{input}


func main(): Int64 {
    return (f<Int64> |> f<(Int64)->Int64>)(0)
}
