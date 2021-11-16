// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func f(input:ArrayList<Int64>):Int64 {0}

func main(): Int64 {
    return ArrayList<Int64>([1].toArray()) |> f
}
