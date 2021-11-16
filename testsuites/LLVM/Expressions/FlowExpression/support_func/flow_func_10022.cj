// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    var a = { input:Int64 => input}

    var b = { input:Int64 => input}

    var c = { input:(Int64)->Int64 => input(1)}

    func test(){
        1 |> a
        a~>b
        1 |> (a~>b)
        return (a ~> b |> c) - 1
    }
}

func main(): Int64 {
    var x = A()
    1 |> x.a
    x.a~>x.b
    1 |> (x.a~>x.b)
    x.a ~> x.b |> x.c
    return (x.a ~> x.b |> x.c) - 1 + x.test()
}
