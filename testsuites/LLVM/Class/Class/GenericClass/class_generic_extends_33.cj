// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


open class Base<T> {
    var a: Int32
    init(x: Int32){
        a = x
    }
}

class Data<T> <: Base<T> {
    var aa: Int32
    init(x: Int32){
        super(x)
        aa = x + 1
    }
}

func foo(x: Int32): Base<Int32>{
    return Data<Int32>(x)
}

func main(): Int64 {
    var base: Base<Int32> = foo(4)
    var res: Int32 = base.a
    if(res == 4){
        return 0
    }
    return 1
}
