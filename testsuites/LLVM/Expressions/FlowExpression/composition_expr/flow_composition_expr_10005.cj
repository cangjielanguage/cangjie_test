// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func x(input:Int64):Int64{0}

func main(): Int64 {
    1 |> ((x ~> x) ~> (x ~> x))
    return 0
}
