// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x(input:Set<Int64>):Set<Int64> {input}

func y(input:Set<Int64>):Set<Int64> {input}

func main(): Int64 {
    #{1} |> (x ~> y)
    return 0
}
