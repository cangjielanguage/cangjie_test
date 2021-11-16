// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    public func foo(x: T): T{
        return x
    }
}

class Data<T> <: Base<T> {
    init(x:T){}
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>(0)
    var res: Int32 = data.foo(3)
    if(res == 3){
        return 0
    }
    return 1
}