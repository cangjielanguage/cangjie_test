package p1

external func foo<T> (a:T): T {
    var a = Aoo<T>(a)
    return a.a
}

class Aoo<T> {
    var a:T
    init(x:T){
        a = x
    }

}