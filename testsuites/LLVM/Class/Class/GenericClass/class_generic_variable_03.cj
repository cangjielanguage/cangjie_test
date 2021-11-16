// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    var base: T
    init(x: T){
        base = x
    }
}

class Data<T> <: Base<Int32> {
    var a: T
    var f: T
    init(x: T){
        super(0)
        a = x
        f = this.a
    }

}

func main(): Int64 {
    var i: Int32 = 4
    var data: Data<Int32> = Data<Int32>(i)
    var res1: Int32 = data.a
    var res2: Int32 = data.f
    if(res1 == 4 && res2 == 4){
        return 0
    }
    return 1
}