package p1

external func coo<T>(x:T) where T <: B {return x}

external interface B{
    func boo(){return 2}
}

external class A <: B {
    var a:Int32
    init(x: Int32){
        a = x
    }
}

