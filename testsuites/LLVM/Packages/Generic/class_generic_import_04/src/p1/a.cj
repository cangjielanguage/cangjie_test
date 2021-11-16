package p1

external class A<T> {
    static var a: Int32 = 1
    static func foo(){
        return a
    }
}

external class B<T> {
    static func foo<V>(x:V){
        return x
    }
}

external class C<T> {
    static func foo(x:Option<T>){
        return x
    }
}
