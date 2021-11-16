// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A{
    static var a : (Int64)->Int64 = { input:Int64 => input}

    static var b : (Int64)->Int64 = { input:Int64 => input}

    static var c : ((Int64)->Int64) -> Int64= { input:(Int64)->Int64 => input(1)}
}


func main(): Int64 {
    1 |> A.a
    A.a~>A.b
    1 |> (A.a~>A.b)
    return (A.a ~> A.b |> A.c) - 1
}
