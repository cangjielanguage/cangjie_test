package p1

external class A<T> {
    var a: Int32 = 1
    func foo(){
        return a
    }
}

external class B<T> {
    static var a: Int32 = 1
    static func foo(){
        return a
    }
}


external class C<T>{
    var a: T
    init(x:T){
        a = x
    }
    func foo(x:T){return x}
}

external class D<T> {
    static var a: Option<T> = None
    static func foo(x:Option<T>){
        return x
    }
}

external class E<T> {
    static func foo<V>(x:V){
        return x
    }
}
