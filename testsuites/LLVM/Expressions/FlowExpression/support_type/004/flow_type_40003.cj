// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x(input:Int32):Int32 {input}

func y(input:Int32):Int32 {input}

func main(): Int64 {
    1 |> (x ~> y)
    return 0
}
