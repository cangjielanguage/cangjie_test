package pkgc
import pkga.*


external class Boo<T> {
    static func foo<V>(x: V): V{
        return x
    }
}

external var a:Int64 = 3