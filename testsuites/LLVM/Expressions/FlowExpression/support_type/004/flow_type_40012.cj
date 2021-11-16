// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x(input:Char):Char {input}

func y(input:Char):Char {input}

func main(): Int64 {
    '1' |> (x ~> y)
    return 0
}
