// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func x(input:Int64):(Int64)->Int64{ { a:Int64 => a}}

func main(): Int64 {
    1 |> ((1 |> x) ~> (1 |> x))
    return 0
}
