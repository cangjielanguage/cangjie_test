package p1

external interface Num<T> {
    func add(other: T): T
}
extend Int32 <: Num<Int32> {
    func add(other: Int32) {
        this + other
    }
}
external var a : Int32 = 1
external class C { var c = 1 }