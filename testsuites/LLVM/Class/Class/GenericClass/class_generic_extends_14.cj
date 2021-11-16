// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    open func foo(x: T, y: T): T{
        return x
    }
}

class Data<T> <: Base<T> {
    override func foo(x: T, y: T): T{
        return y
    }
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>()
    var res: Int32 = data.foo(3, 4)
    if(res == 4){
        return 0
    }
    return 1
}
