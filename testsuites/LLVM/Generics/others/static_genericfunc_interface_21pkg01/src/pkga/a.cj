
package pkga

external interface Boo<T> {
    static func foo<V>(x: V): V{
        return x
    }
}

external class Coo<T> <: Boo<T>{
}