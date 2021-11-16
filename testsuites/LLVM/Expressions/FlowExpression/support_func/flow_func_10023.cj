// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    private var a = { input:Int64 => input}

    private var b = { input:Int64 => input}

    private var c = { input:(Int64)->Int64 => input(1)}

    func test(){
        1 |> a
        a~>b
        1 |> (a~>b)
        return (a ~> b |> c) - 1
    }
}

func main(): Int64 {
    var x = A()
    return x.test()
}
