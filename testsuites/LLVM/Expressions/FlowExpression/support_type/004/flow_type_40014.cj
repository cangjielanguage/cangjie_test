// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x(input:Unit):Unit {input}

func y(input:Unit):Unit {input}

func main(): Int64 {
    () |> (x ~> y)
    return 0
}
