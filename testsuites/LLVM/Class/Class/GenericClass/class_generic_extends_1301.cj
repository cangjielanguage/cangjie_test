// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    init(x: T){}
    open func foo(x: T): String{
        return "Father"
    }
}

class Data<T> <: Base<Int32> {
    init(input:T){ super(0) }
    func foo(x: T): String{
        return "Child"
    }
}

func main(): Int64 {
    var data: Data<Int64> = Data<Int64>(0)
    var res: String = data.foo(3)
    if(res == "Child"){
        return 0
    }
    return 1
}
