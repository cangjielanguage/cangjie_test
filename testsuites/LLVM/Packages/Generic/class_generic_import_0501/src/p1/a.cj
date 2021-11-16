package p1

open external class A<T> {
    static var a: Int32 = 1
    static func foo(){
        return a
    }
}

open external class B<T> {
    static func foo<V>(x:V){
        return x
    }
}

open external class C<T> {
    static func foo(x:Option<T>){
        return x
    }
}