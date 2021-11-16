// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x(input:ArrayList<Int64>):ArrayList<Int64> {input}

func y(input:ArrayList<Int64>):ArrayList<Int64> {input}

func main(): Int64 {
    ArrayList<Int64>([1].toArray()) |> (x ~> y)
    return 0
}
