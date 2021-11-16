// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x(input:(Int64)->Int64):(Int64)->Int64 {input}

func y(input:(Int64)->Int64):(Int64)->Int64 {input}

func main(): Int64 {
    { input:Int64 => input} |> (x ~> y)
    return 0
}
