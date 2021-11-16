// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x(input:UInt32):UInt32 {input}

func y(input:UInt32):UInt32 {input}

func main(): Int64 {
    1 |> (x ~> y)
    return 0
}
