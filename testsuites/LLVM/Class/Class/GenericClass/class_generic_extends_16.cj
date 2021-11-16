// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


open class Father<V>{
    var a: V
    var b: V
    init(x: V, y:V){
        a = x
        b = y
    }
}
class Child<U> <: Father<U>{
    var c: U
    var d: U
    init(x: U, y:U){
        c = x
        d = y
    }
}


open class Base<T> {
    init(x: T){}
    open func foo<V>(x: V, y: V): Father<V>{
        return Father<V>(x, y)
    }
}

class Data<T> <: Base<T> {
    init(x: T){}
    override func foo<U>(x: U, y:U): Child<U>{
        return Child<U>(x, y)
    }
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>()
    var res: Child = data.foo<Int32>(3, 4)
    var res1: Int32 = res.c
    var res2: Int32 = res.d
    if(res1 == 3 && res2 == 4){
        return 0
    }
    return 1
}