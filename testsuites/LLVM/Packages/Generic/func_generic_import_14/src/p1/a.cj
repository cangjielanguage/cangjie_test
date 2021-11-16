package p1

external func coo<T>(x:T) where T <: B {return x}

external interface B{}

external class A {
    var a:Int32
    init(x: Int32){
        a = x
    }
}

extend A <: B{}
