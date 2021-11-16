// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x(input:List<Int64>):List<Int64> {input}

func y(input:List<Int64>):List<Int64> {input}

func main(): Int64 {
    [1] |> (x ~> y)
    return 0
}
