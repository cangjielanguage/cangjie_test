// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x(input:Bool):Bool {input}

func y(input:Bool):Bool {input}

func main(): Int64 {
    true |> (x ~> y)
    return 0
}
