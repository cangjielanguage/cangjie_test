// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface B{
    static func a(input:Int64):Int64{input}

    static func b(input:Int64):Int64{input}

    static func c(input:(Int64)->Int64):Int64{input(1)}
}
class A <: B{}


func main(): Int64 {
    1 |> A.a
    A.a~>A.b
    1 |> (A.a~>A.b)
    return (A.a ~> A.b |> A.c) - 1
}
