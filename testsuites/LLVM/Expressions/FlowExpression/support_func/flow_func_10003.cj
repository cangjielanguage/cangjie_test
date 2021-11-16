// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a = { input:Int64 => input}

var b = { input:Int64 => input}

var c = { input:(Int64)->Int64 => input(1)}

func main(): Int64 {
    1 |> a
    a~>b
    1 |> (a~>b)
    a ~> b |> c
    return (a ~> b |> c) - 1
}
