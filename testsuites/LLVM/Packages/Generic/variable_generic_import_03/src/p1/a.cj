package p1

external var a = A<Int32>(1,1)
external let b = A<Int32>(2,2)

external class A<T>{
    var a: T
    let b: T
    init(x: T,y:T){
        a = x
        b = y
    }
}