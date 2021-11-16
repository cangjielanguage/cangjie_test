// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x(input:Float64):Float64 {input}

func y(input:Float64):Float64 {input}

func main(): Int64 {
    1.0 |> (x ~> y)
    return 0
}
