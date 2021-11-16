package p1

external func foo<T> (a:T): T where T <: Aoo {
    return a
}

class Aoo {
    var a:Int32
    init(x:Int32){
        a = x
    }

}