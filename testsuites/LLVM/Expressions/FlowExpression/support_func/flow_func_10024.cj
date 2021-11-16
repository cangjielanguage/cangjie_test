// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A{
    protected var a = { input:Int64 => input}

    protected var b = { input:Int64 => input}


    protected var c = { input:(Int64)->Int64 => input(1)}
}

class B <: A{
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
