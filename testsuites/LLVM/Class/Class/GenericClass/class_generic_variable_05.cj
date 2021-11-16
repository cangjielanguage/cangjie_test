// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    var base: T
    init(x: T){
        base = x
    }

}

class Data<T> <: Base<Int32> {
    var f: T
    init(n: T) {
        super(0)
        f = n
    }
    func foo(input:T){
        f = input
    }
}

func main(): Int64 {
    var i1: Int32 = 3
    var data: Data<Int32> = Data<Int32>(0)
    data.foo(i1)
    var res: Int32 = data.f
    if(res == 3){
        return 0
    }
    return 1
}