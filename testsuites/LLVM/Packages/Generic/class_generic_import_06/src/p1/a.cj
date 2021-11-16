package p1

open external class A<T>{
    static func foo(x:Option<T>){return x}
}

open external class B<T>{
    var a: T
    init(x:T){
        a = x
    }
}
