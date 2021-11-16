package p1

external class C {}
external interface Add<T> {
    func add(other: T): T
}

extend Int64 <: Add<Int64> {
    func add(other: Int64): Int64 {
        return this + other
    }
}