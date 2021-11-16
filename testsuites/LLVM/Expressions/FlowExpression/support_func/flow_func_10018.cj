// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A{
    var a : (Int64)->Int64 = { input:Int64 => input}

    var b : (Int64)->Int64 = { input:Int64 => input}

    var c : ((Int64)->Int64) ->Int64 = { input:(Int64)->Int64 => input(1)}

    init() {}
}


func main(): Int64 {
    var i = A()
    1 |> i.a
    i.a~>i.b
    1 |> (i.a~>i.b)
    return (i.a ~> i.b |> i.c) - 1
}
