// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func x(input:String):String {input}

func y(input:String):String {input}

func main(): Int64 {
    "a" |> (x ~> y)
    return 0
}
