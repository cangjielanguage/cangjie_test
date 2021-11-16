// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    static var a = { input:Int64 => input}

    static var b = { input:Int64 => input}

    static var c = { input:(Int64)->Int64 => input(1)}
}


func main(): Int64 {
    1 |> A.a
    A.a~>A.b
    1 |> (A.a~>A.b)
    return (A.a ~> A.b |> A.c) - 1
}
