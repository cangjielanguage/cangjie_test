package pkga

external open class Boo<T>{
    static func foo<V>(x:T,y:V) {
        return y
    }
}