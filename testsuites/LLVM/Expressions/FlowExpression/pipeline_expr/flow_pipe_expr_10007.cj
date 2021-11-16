// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func f(input:Int64):Int64{0}
func x(input:Int64):Int64{input}

func main(): Int64 {
    return f ~> x |> { input:(Int64)->Int64 => input(0)}
}
