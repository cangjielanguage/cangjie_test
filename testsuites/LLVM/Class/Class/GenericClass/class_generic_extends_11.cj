// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    init(x: T){}
    open func foo(x: Int32): String{
        return x.toString()
    }
}

class Data<T> <: Base<Int32> {
    init(input:T){ super(0) }
    override func foo(x: Int32): String{
        return (x+1).toString()
    }
}


class Time<T> <: Base<T> {
    init(input:T){ super(input) }
    override func foo(x: Int32): String{
        return (x+2).toString()
    }
}


func main(): Int64 {
    var data: Data<Int32> = Data<Int32>(0)
    var time: Time<Int32> = Time<Int32>(0)
    var res: String = data.foo(3)
    var res2: String = time.foo(3)
    if(res == "4" && res2 == "5"){
        return 0
    }
    return 1
}
