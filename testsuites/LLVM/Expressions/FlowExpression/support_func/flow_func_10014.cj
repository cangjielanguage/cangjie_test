// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A{
    func a(input:Int64):Int64

    func b(input:Int64):Int64

    func c(input:(Int64)->Int64):Int64
}

class B <: A{
    func a(input:Int64):Int64{input}
    func b(input:Int64):Int64{input}
    func c(input:(Int64)->Int64):Int64{input(1)}
}


func main(): Int64 {
    var i : A = B()
    1 |> i.a
    i.a~>i.b
    1 |> (i.a~>i.b)
    return (i.a ~> i.b |> i.c) - 1
}
