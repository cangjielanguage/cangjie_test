// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Base<T> {
    open func foo(x: T, y: T): T{
        return x
    }

}

class Data<T> <: Base<T> {
    init(x:T){}
    override func foo(x: T, y: T): T{
        return y
    }
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>(2)
    var i1: Int32 = 3
    var i2: Int32 = 4
    var res: Int32 = data.foo(i1, i2)
    if(res == 4){
        return 0
    }
    return 1
}
