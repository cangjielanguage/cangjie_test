// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func a(input:Int64):Int64{input}

func b(input:Int64):Int64{input}

func c(input:(Int64)->Int64):Int64{input(1)}

func main(): Int64 {
    1 |> a
    a~>b
    1 |> (a~>b)
    a ~> b |> c
    return ((a ~> b) |> c) - 1
}
