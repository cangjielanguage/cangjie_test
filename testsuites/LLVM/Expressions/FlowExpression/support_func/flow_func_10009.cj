// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    open func a(input:Int64):Int64{input}

    open func b(input:Int64):Int64{input}

    open func c(input:(Int64)->Int64):Int64{input(1)}
}

class B <: A{
    override open func a(input:Int64):Int64{input}

    override open func b(input:Int64):Int64{input}

    override open func c(input:(Int64)->Int64):Int64{input(1)}

    func test(){
        1 |> a
        a~>b
        1 |> (a~>b)
        return (a ~> b |> c) - 1
    }
}

func main(): Int64 {
    var x = B()
    return x.test()
}
