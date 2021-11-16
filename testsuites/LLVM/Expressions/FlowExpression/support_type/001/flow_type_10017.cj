// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func f(input:String):Int64 {0}

func main(): Int64 {
    return "a" |> f
}
