// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    protected var base: T
    init(x: T){
        base = x
    }

}

class Data<T> <: Base<Int32> {
    var d: Int32
    init(input:T){
        super(3)
        d = super.base
    }
}

func main(): Int64 {
    var i1: Int32 = 5
    var data: Data<Int32> = Data<Int32>(i1)
    var res: Int32 = data.d
    if(res == 3){
        return 0
    }
    return 1
}
