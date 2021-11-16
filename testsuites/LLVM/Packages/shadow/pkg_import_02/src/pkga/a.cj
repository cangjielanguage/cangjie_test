package pkga

class Coo<T> {
    static func foo<V>(x: V): V{
        return x
    }
    var a = pkga.Boo<T>()
    var b = pkga.foo()
}


func foo(){
    return 1
}

external var a:Int64 = 1