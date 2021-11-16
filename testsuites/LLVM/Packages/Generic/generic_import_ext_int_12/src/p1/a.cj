package p1

external func foo<T,V> (a:T): T where T <: Aoo<V> {
    return a
}

class Aoo<T> {
    var a:T
    init(x:T){
        a = x
    }

}