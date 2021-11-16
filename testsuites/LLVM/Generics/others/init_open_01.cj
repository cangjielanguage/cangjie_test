// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    var base: T
    init(x: T){
        base = x
    }

}

class Data<T> <: Base<T> {
    init(n: T) {
        super(n)
    }
    func foo(x: T): T{
        return x
    }
}

func main(): Int64 {
    var i1: Int32 = 3
    var data: Data<Int32> = Data<Int32>(0)
    var res: Int32 = data.foo(i1)
    if(res == 3){
        return 0
    }
    return 1
}