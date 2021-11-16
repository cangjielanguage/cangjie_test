// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


open class Father{
    var a: Int32
    var b: Int32
    init(x: Int32, y:Int32){
        a = x
        b = y
    }
}
class Child <: Father{
    var c: Int32
    var d: Int32
    init(x: Int32, y:Int32){
        super(0, 0)
        c = x
        d = y
    }
}


open class Base<T> {
    init(x: T){}
    open func foo(x: Int32, y:Int32): Father{
        return Father(x, y)
    }
}

class Data<T> <: Base<T> {
    init(x: T){ super(x) }
    override func foo(x: Int32, y:Int32): Child{
        return Child(x, y)
    }
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>(0)
    var res: Child = data.foo(3, 4)
    var res1: Int32 = res.c
    var res2: Int32 = res.d
    if(res1 == 3 && res2 == 4){
        return 0
    }
    return 1
}