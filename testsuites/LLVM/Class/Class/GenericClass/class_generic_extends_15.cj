// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    init(x: T){}
    open func foo<V>(x: V, y: V): V{
        return x
    }
}

class Data<T> <: Base<T> {
    init(input:T){}
    override func foo<U>(x: U, y: U): U{
        return y
    }
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>()
    var res: Int32 = data.foo<Int32>(3, 4)
    if(res == 4){
        return 0
    }
    return 1
}
