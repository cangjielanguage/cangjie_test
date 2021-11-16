package p1

external func aoo<T> (x:T) where T <: Int32 {return x}
external func boo<T,V> (x:T,y:V) where T<: A {return x}

external class A {
    var a:Int32
    init(x: Int32){
        a = x
    }
}