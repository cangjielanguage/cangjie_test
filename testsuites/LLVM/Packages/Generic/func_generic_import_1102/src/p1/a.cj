package p1

external func boo<T,V> (x:T,y:V) where T<: A {return x}

external class A {
    var a:Int32
    init(x: Int32){
        a = x
    }
}
