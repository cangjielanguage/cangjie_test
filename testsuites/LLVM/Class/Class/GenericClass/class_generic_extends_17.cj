// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    init(x: T){}
    func foo(x: Int32): String{
        return x.toString()
    }
}

class Data<T> <: Base<T> {
    init(input:T){ super(input) }
    func foo(x: Int32 , y: Int32): String{
        return (x+y).toString()
    }
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>(0)
    var res: String = data.foo(3, 4)
    if(res == "7"){
        return 0
    }
    return 1
}